# function to download mandatory packages

pkgLoad <- function( packages = "favorites" ) {

    if( length( packages ) == 1L && packages == "favorites" ) {
        packages <- c( "devtools", "ggplot2", "tidyr", "RColorBrewer", "viridis",
                       "pheatmap", "ConsensusClusterPlus", "ComplexHeatmap", "circlize", "ggpubr"
        )
    }

    packagecheck <- match( packages, utils::installed.packages()[,1] )

    packagestoinstall <- packages[ is.na( packagecheck ) ]

    if( length( packagestoinstall ) > 0L ) {
        utils::install.packages( packagestoinstall,
                             repos = "https://cloud.r-project.org"
        )
    } else {
        print( "All requested packages already installed" )
    }

    for( package in packages ) {
        suppressPackageStartupMessages(
            library( package, character.only = TRUE, quietly = TRUE )
        )
    }

}

# main : install packages if necessary

pkgLoad("favorites")
