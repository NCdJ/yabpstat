# WARNING - Generated by {fusen} from dev/flat_full.Rmd: do not edit by hand


#' Title: data_serie
#' 
#' Description: This is an helper function to show a table with data from a BPstat serie and used from the main function ya_info_serie()
#' 
#' @param id A serie ID from the BPstat.
#' @param lng A string that represents the languages supported by BPstat API. Currently only uses "PT" or "EN". Defaults to "EN"
#' 
#' @importFrom httr2 request
#' @importFrom httr2 req_user_agent
#' @importFrom httr2 req_perform
#' @importFrom httr2 resp_status
#' @importFrom jsonlite read_json
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr between
#' @importFrom dplyr tibble
#' @importFrom tidyr unnest_longer
#' @importFrom tidyr unnest_wider
#' @importFrom dplyr mutate
#' @importFrom dplyr across
#' @importFrom dplyr select
#' @importFrom htmltools tags
#' @importFrom DT datatable
#' @importFrom knitr kable
#' 
#' @return A data tables with information abot the serie
#' 
#' @noRd
#' 
data_serie <- function(id, lng){
  
  basepath <- "https://bpstat.bportugal.pt"
  
  url_sv <- paste0(basepath,
                   "/api/observations/?series_ids=",
                   id)
  
  url_sfv <- paste0(basepath,
                    "/api/series/?view_full=true&page_size=1&series_ids=",
                    id)
  
  response <- httr2::request(url_sv) %>% 
    httr2::req_user_agent("YABPstat package") %>% 
    httr2::req_perform()
  
  st_c <- httr2::resp_status(response)
  
  status_description <-
    check_status_code(st_c, lng)
  
  url_sv_json <- jsonlite::read_json(url_sv)
  
  if (dplyr::between(st_c, 300, 550)) {
    stp_msg <- paste0("Estado :",
                      st_c,
                      " - ",
                      status_description,
                      ".")
    
    stop(stp_msg)
  }
  
  df_data <- url_sv_json %>%
    dplyr::tibble() %>%
    tidyr::unnest_longer(1) %>%
    tidyr::unnest_wider(1) %>%
    dplyr::mutate(dplyr::across(reference_date, as.Date),
                  dplyr::across(pub_date, as.Date),
                  dplyr::across(value, as.numeric)) %>%
    dplyr::select(reference_date, value, pub_date)
  
  url_sfv_json <- jsonlite::fromJSON(url_sfv)
  
  if (lng == "EN" || lng == "en") {
    column_names <-
      c("Reference date",
        "Value",
        "Updated at")
    
    capt <- paste0("YABPstat: Information about \"",
                   url_sfv_json[["data"]][["title"]][["EN"]],
                   "\"")
    
    translate_to <-
      "//cdn.datatables.net/plug-ins/1.10.11/i18n/English.json"
    
    
  } else {
    column_names <-
      c("Data refer\u00eancia",
        "Valor",
        "Atualiza\u00e7\u00e3o em")
    
    capt <- paste0("YABPstat: Informa\u00e7\u00e3o acerca \"",
                   url_sfv_json[["data"]][["title"]][["PT"]],
                   "\"")
    
    translate_to <-
      "//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json"
    
  }

      if (commandArgs()[1] == "RStudio"){  
  DT::datatable(
    data = df_data,
    extensions = "Buttons",
    style = "auto",
    class = "cell-border stripe",
    rownames = FALSE,
    colnames = column_names,
    caption = htmltools::tags$caption(style = "caption-side: top; 
                                      text-align: center; 
                                      color:black;  
                                      font-size:200% ;",
                                      capt),
    options = list(
      columnDefs = list(list(
        className = "dt-center", targets = c(1)
      )),
      searchHighlight = TRUE,
      search = list(regex = TRUE),
      order = list(list(0, "asc")),
      options = list(dom = "Bft",
                     buttons = c("csv", "excel", "pdf")),
      language = list(url = translate_to)
    )
  )
      } else {
        
        knitr::kable(x = df_data,
                     caption = capt,
                     col.names = column_names, 
                     align = "ccc", 
                     format = "pipe")

    }

}
