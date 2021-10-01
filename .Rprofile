
.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "https://cloud.r-project.org/"
  Sys.setenv(TZ = "Europe/Berlin")
  cores = as.integer(Sys.getenv("NCPUS", parallel::detectCores()))

  options(
    menu.graphics = FALSE,
    useFancyQuotes = FALSE,
    mc.cores = cores,
    Ncpus = cores,
    setWidthOnResize = TRUE,
    max.print = 10000L,
    digits = 4L,
    scipen = 2L,
    deparse.max.lines = 3L,
    show.signif.stars = FALSE,
    help_type = "html",
    repos = repos,
    datatable.print.class = TRUE,
    datatable.print.keys = TRUE,
    BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de"
  )
  Sys.setenv(LANGUAGE = "en")
  Sys.setlocale("LC_ALL", "en_US.UTF-8")

  user.lib = Sys.getenv("R_LIBS_USER")
  if (!dir.exists(user.lib)) {
    message("Creating empty user library ", user.lib)
    dir.create(user.lib, recursive = TRUE)
  }
}