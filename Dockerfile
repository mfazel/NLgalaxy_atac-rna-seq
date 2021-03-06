
# Galaxy - ATAC-RNA-Seq for Neurolincs pipelines

#FROM quay.io/bgruening/galaxy-ngs-preprocessing:17.09

#FROM bgruening/galaxy-stable
FROM bgruening/galaxy-stable:16.07

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND="RNA-Seq"

# Install RNA seq tools
ADD atac_rna_seq_tools.yml $GALAXY_ROOT/tools.yaml
ADD dependency_resolvers_conf.xml $GALAXY_ROOT/dependency_resolvers_conf.xml
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs
