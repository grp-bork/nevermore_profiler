#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { nevermore_main } from "./nevermore/workflows/nevermore"
include { nevermore_align } from "./nevermore/workflows/align"
include { gffquant_flow } from "./nevermore/workflows/gffquant"
include { fastq_input } from "./nevermore/workflows/input"
include { collate_stats } from "./nevermore/modules/collate"


if (params.input_dir && params.remote_input_dir) {
	log.info """
		Cannot process both --input_dir and --remote_input_dir. Please check input parameters.
	""".stripIndent()
	exit 1
} else if (!params.input_dir && !params.remote_input_dir) {
	log.info """
		Neither --input_dir nor --remote_input_dir set.
	""".stripIndent()
	exit 1
}

def input_dir = (params.input_dir) ? params.input_dir : params.remote_input_dir
def do_preprocessing = (!params.skip_preprocessing || params.run_preprocessing)


params.ignore_dirs = ""


workflow {

	fastq_input(
		Channel.fromPath(input_dir + "/*", type: "dir")
			.filter { !params.ignore_dirs.split(",").contains(it.name) },
		Channel.of(null)
	)

	fastq_ch = fastq_input.out.fastqs
	
	nevermore_main(fastq_ch)

	gq_input_ch = nevermore_main.out.fastqs
		.map { sample, fastqs ->
		sample_id = sample.id.replaceAll(/.(orphans|singles|chimeras)$/, "")
		return tuple(sample_id, [fastqs].flatten())
	}
	.groupTuple()
	.map { sample_id, fastqs -> return tuple(sample_id, [fastqs].flatten()) }
	gq_input_ch.view()

	
	gffquant_flow(gq_input_ch)		

}
