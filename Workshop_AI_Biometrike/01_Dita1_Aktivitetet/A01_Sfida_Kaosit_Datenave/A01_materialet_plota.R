# ==============================================================================
# AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE
# GJENERIMI I TË GJITHA MATERIALEVE
# ==============================================================================
#
# Qëllimi:
#   Gjeneron të gjitha materialet instruksionale për Aktivitetin 1:
#   - Dataset sintetik me gabime të qëllimshme (50 rekorde)
#   - Slides prezantimi (Beamer LaTeX)
#   - Shënimet e facilitatorit
#   - Fletëpalosja e pjesëmarrësve
#   - Udhëzimet e ushtrimeve
#   - Çelësi i zgjidhjeve
#
# Audienca:
#   Stafi IT i Gjendjes Civile Shqiptare
#
# Kohëzgjatja:
#   60 minuta (10 min demo + 40 min praktikë + 10 min debriefing)
#
# Përdorimi:
#   1. Sigurohuni që keni ekzekutuar workshop_folder_structure.R
#   2. Ekzekutoni: source("A01_materialet_plota.R")
#
# ==============================================================================

# Pastroni workspace
rm(list = ls())

# Regjistro kohën e fillimit
koha_fillimit <- Sys.time()

cat("\n")
cat("╔══════════════════════════════════════════════════════════════════════════════╗\n")
cat("║                                                                              ║\n")
cat("║   AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE                               ║\n")
cat("║   AI si Motor Standardizimi                                                  ║\n")
cat("║                                                                              ║\n")
cat("║   Gjenerimi i Materialeve të Plota                                           ║\n")
cat("║                                                                              ║\n")
cat("╚══════════════════════════════════════════════════════════════════════════════╝\n")
cat("\n")

# ==============================================================================
# KONFIGURIMI
# ==============================================================================

# Seed për riprodhueshmëri
set.seed(2024)

# Rruga e dosjes së aktivitetit
rruga_projekti <- file.path(getwd(), "Workshop_AI_Biometrike")
rruga_aktiviteti <- file.path(rruga_projekti, "01_Dita1_Aktivitetet", 
                               "A01_Sfida_Kaosit_Datenave")

# Verifiko që struktura ekziston
if (!dir.exists(rruga_aktiviteti)) {
  stop("GABIM: Struktura e dosjeve nuk ekziston. Ekzekutoni workshop_folder_structure.R së pari.")
}

cat(sprintf("  Rruga e aktivitetit: %s\n", rruga_aktiviteti))
cat("\n")

# ==============================================================================
# SEKSIONI 1: TË DHËNAT REFERENCË SHQIPTARE
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 1: Ngarkimi i të dhënave referencë shqiptare...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# Emrat mashkullore shqiptarë
emrat_meshkuj <- c(
  "Agron", "Arben", "Ardian", "Artan", "Bashkim", "Besnik", "Bledar", "Blerim",
  "Bujar", "Dashamir", "Dritan", "Edmond", "Endrit", "Ermal", "Ervin", "Fatmir",
  "Flamur", "Gëzim", "Gramoz", "Hysen", "Ilir", "Ismet", "Jetmir", "Kastriot",
  "Klevis", "Kujtim", "Luan", "Lulzim", "Mërgim", "Naim", "Petrit", "Qemal",
  "Rexhep", "Shkelqim", "Shkëlzen", "Sokol", "Taulant", "Visar", "Xhevdet", "Ylber"
)

# Emrat femërorë shqiptarë
emrat_femra <- c(
  "Afërdita", "Albana", "Alma", "Anila", "Besa", "Blerta", "Dorina", "Drita",
  "Edlira", "Elona", "Entela", "Fatime", "Flutura", "Gentiana", "Gerta", "Hana",
  "Irena", "Jehona", "Jonida", "Kozeta", "Lindita", "Luljeta", "Manjola", "Mimoza",
  "Nora", "Ornela", "Pranvera", "Qëndresa", "Rozafa", "Shpresa", "Teuta", "Vjollca"
)

# Mbiemrat shqiptarë
mbiemrat <- c(
  "Ahmeti", "Bajrami", "Bektashi", "Beqiri", "Berisha", "Brahimi", "Bytyqi",
  "Demiri", "Dervishi", "Gashi", "Halili", "Hasani", "Hoxha", "Hyseni", "Islami",
  "Kastrati", "Kelmendi", "Krasniqi", "Kurti", "Leka", "Maloku", "Murati",
  "Osmani", "Pllana", "Rexhepi", "Shala", "Shehu", "Sulejmani", "Xhaferi", "Zeka"
)

# Qytetet shqiptare me kodet postare
qytetet <- data.frame(
  qyteti = c("Tiranë", "Durrës", "Vlorë", "Shkodër", "Elbasan", "Fier", "Korçë",
             "Berat", "Lushnjë", "Pogradec", "Kavajë", "Gjirokastër", "Sarandë",
             "Lezhë", "Kukës", "Peshkopi", "Burrel", "Krujë", "Laç", "Kamëz"),
  kodi_postar = c("1001", "2001", "9401", "4001", "3001", "9301", "7001",
                  "5001", "9001", "7301", "2501", "6001", "9701", "4501",
                  "8501", "8301", "8001", "1501", "4601", "1051"),
  stringsAsFactors = FALSE
)

# Emrat e rrugëve
prefikset_rrugeve <- c("Rruga", "Bulevardi", "Sheshi", "Lagja")
emrat_rrugeve <- c(
  "Skënderbeu", "Dëshmorët e Kombit", "Myslym Shyri", "Barrikadave",
  "Ibrahim Rugova", "Bajram Curri", "Nënë Tereza", "Ismail Qemali",
  "Sami Frashëri", "Naim Frashëri", "28 Nëntori", "Lidhja e Prizrenit",
  "Reshit Çollaku", "Ali Demi", "Muhamet Gjollesha", "Kavajës"
)

# Emrat e muajve në shqip
muajt_shqip <- c(
  "Janar", "Shkurt", "Mars", "Prill", "Maj", "Qershor",
  "Korrik", "Gusht", "Shtator", "Tetor", "Nëntor", "Dhjetor"
)

cat("  ✓ U ngarkuan: 40 emra meshkuj, 32 emra femra, 30 mbiemra\n")
cat("  ✓ U ngarkuan: 20 qytete me kode postare\n")
cat("  ✓ U ngarkuan: Komponentët e adresave dhe muajt\n")
cat("\n")

# ==============================================================================
# SEKSIONI 2: FUNKSIONET NDIHMËSE
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 2: Përcaktimi i funksioneve ndihmëse...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# ------------------------------------------------------------------------------
# Funksioni: Gjenero datë me format kaotik
# ------------------------------------------------------------------------------
gjenero_date_kaotike <- function(data_baze) {
  # Gjeneron të njëjtën datë në formate të ndryshme të pakonsisueshme
  
  dita <- format(data_baze, "%d")
  dita_pa_zero <- as.integer(dita)
  muaji_num <- format(data_baze, "%m")
  muaji_int <- as.integer(muaji_num)
  muaji_en <- format(data_baze, "%B")
  muaji_shqip <- muajt_shqip[muaji_int]
  viti <- format(data_baze, "%Y")
  viti_shkurt <- format(data_baze, "%y")
  
  # 12 formate të ndryshme kaotike
  formatet <- c(
    paste0(dita, "/", muaji_num, "/", viti),                      # 15/03/1987
    paste0(muaji_num, "-", dita, "-", viti),                      # 03-15-1987 (gabim US)
    paste0(viti, "-", muaji_num, "-", dita),                      # 1987-03-15 (ISO korrekt)
    paste0(dita, ".", muaji_num, ".", viti),                      # 15.03.1987 (Europian)
    paste0(muaji_en, " ", dita_pa_zero, ", ", viti),              # March 15, 1987
    paste0(dita_pa_zero, " ", muaji_shqip, " ", viti),            # 15 Mars 1987
    paste0(dita, "/", muaji_num, "/", viti_shkurt),               # 15/03/87
    paste0(viti, muaji_num, dita),                                 # 19870315
    paste0(dita, "-", muaji_shqip, "-", viti),                    # 15-Mars-1987
    paste0(muaji_num, "/", dita, "/", viti),                      # 03/15/1987 (US)
    paste0(dita_pa_zero, ".", muaji_int, ".", viti),              # 15.3.1987
    paste0(muaji_shqip, " ", dita_pa_zero, ", ", viti)            # Mars 15, 1987
  )
  
  return(sample(formatet, 1))
}

# ------------------------------------------------------------------------------
# Funksioni: Gjenero emër me kapitalizim kaotik
# ------------------------------------------------------------------------------
gjenero_emer_kaotik <- function(emri, mbiemri) {
  # Gjeneron emra me kapitalizim të pakonsisueshëm
  
  formatet <- c(
    paste(emri, mbiemri),                                          # Agron Hoxha (korrekt)
    paste(toupper(emri), toupper(mbiemri)),                        # AGRON HOXHA
    paste(tolower(emri), tolower(mbiemri)),                        # agron hoxha
    paste(toupper(emri), mbiemri),                                 # AGRON Hoxha
    paste(emri, toupper(mbiemri)),                                 # Agron HOXHA
    paste(tolower(emri), toupper(mbiemri)),                        # agron HOXHA
    paste(toupper(substr(emri, 1, 1)), 
          tolower(substr(emri, 2, nchar(emri))), " ",
          toupper(mbiemri), sep = "")                               # Agron HOXHA
  )
  
  return(sample(formatet, 1))
}

# ------------------------------------------------------------------------------
# Funksioni: Gjenero adresë me format kaotik
# ------------------------------------------------------------------------------
gjenero_adrese_kaotike <- function(qyteti_data) {
  # Gjeneron adresa me shkurtesa dhe formatime të pakonsisueshme
  
  prefiksi <- sample(prefikset_rrugeve, 1)
  emri_rruges <- sample(emrat_rrugeve, 1)
  nr_nderteses <- sample(1:150, 1)
  nr_apartamenti <- sample(1:50, 1)
  
  formatet <- c(
    paste0(prefiksi, " ", emri_rruges, " Nr. ", nr_nderteses, 
           ", Ap. ", nr_apartamenti, ", ", qyteti_data$qyteti, " ", qyteti_data$kodi_postar),
    paste0(prefiksi, " ", emri_rruges, ", ", nr_nderteses, 
           "/", nr_apartamenti, ", ", qyteti_data$qyteti),
    paste0("Rr. ", emri_rruges, " ", nr_nderteses, ", ", 
           toupper(qyteti_data$qyteti)),
    paste0(emri_rruges, ", nr ", nr_nderteses, " ap ", nr_apartamenti, 
           " - ", qyteti_data$qyteti, " (", qyteti_data$kodi_postar, ")"),
    paste0(toupper(prefiksi), " ", toupper(emri_rruges), " ", 
           nr_nderteses, ", ", qyteti_data$kodi_postar, " ", qyteti_data$qyteti),
    paste0(prefiksi, ". ", emri_rruges, " no.", nr_nderteses, 
           " apt.", nr_apartamenti, ", ", qyteti_data$qyteti),
    paste0("L. ", sample(1:20, 1), ", Rr. ", emri_rruges, ", Nd. ", nr_nderteses,
           ", ", qyteti_data$qyteti)
  )
  
  return(sample(formatet, 1))
}

# ------------------------------------------------------------------------------
# Funksioni: Gjenero numër ID shqiptar sintetik
# ------------------------------------------------------------------------------
gjenero_nid_shqiptar <- function(datelindja, gjinia) {
  # Gjeneron numër identifikimi sintetik në formatin shqiptar
  # Shënim: Format i thjeshtuar për qëllime trajnimi
  
  kodi_vitit <- substr(format(datelindja, "%Y"), 3, 4)
  kodi_muajit <- format(datelindja, "%m")
  kodi_dites <- format(datelindja, "%d")
  kodi_gjinise <- ifelse(gjinia == "M", sample(0:4, 1), sample(5:9, 1))
  seria <- sprintf("%03d", sample(1:999, 1))
  kontrolli <- sample(0:9, 1)
  
  # Shto paqëndrueshmëri formatimi rastësisht
  if (sample(c(TRUE, FALSE), 1, prob = c(0.3, 0.7))) {
    return(paste0(kodi_vitit, kodi_muajit, kodi_dites, "-", kodi_gjinise, seria, kontrolli))
  } else {
    return(paste0(kodi_vitit, kodi_muajit, kodi_dites, kodi_gjinise, seria, kontrolli))
  }
}

# ------------------------------------------------------------------------------
# Funksioni: Gjenero telefon me format kaotik
# ------------------------------------------------------------------------------
gjenero_telefon_kaotik <- function() {
  prefiksi_cel <- sample(66:69, 1)
  numri <- sample(1000000:9999999, 1)
  
  formatet <- c(
    sprintf("+355 %d %s %s", prefiksi_cel, substr(numri, 1, 3), substr(numri, 4, 7)),
    sprintf("00355%d%d", prefiksi_cel, numri),
    sprintf("0%d-%s-%s", prefiksi_cel, substr(numri, 1, 3), substr(numri, 4, 7)),
    sprintf("+355-%d-%s-%s", prefiksi_cel, substr(numri, 1, 3), substr(numri, 4, 7)),
    sprintf("(0%d) %s %s", prefiksi_cel, substr(numri, 1, 3), substr(numri, 4, 7)),
    sprintf("0%d %d", prefiksi_cel, numri),
    sprintf("0%d.%s.%s", prefiksi_cel, substr(numri, 1, 3), substr(numri, 4, 7))
  )
  
  return(sample(formatet, 1))
}

# ------------------------------------------------------------------------------
# Funksioni: Gjenero email
# ------------------------------------------------------------------------------
gjenero_email <- function(emri, mbiemri) {
  domain_et <- c("gmail.com", "yahoo.com", "hotmail.com", "outlook.com", 
                 "live.com", "gov.al", "edu.al", "abcom.al")
  
  emri_paster <- gsub("[ëç]", "e", tolower(emri))
  mbiemri_paster <- gsub("[ëç]", "e", tolower(mbiemri))
  
  formatet <- c(
    paste0(emri_paster, ".", mbiemri_paster, "@", sample(domain_et, 1)),
    paste0(substr(emri_paster, 1, 1), mbiemri_paster, "@", sample(domain_et, 1)),
    paste0(emri_paster, substr(mbiemri_paster, 1, 1), sample(1:99, 1), "@", sample(domain_et, 1)),
    paste0(toupper(emri_paster), ".", toupper(mbiemri_paster), "@", sample(domain_et, 1)),
    paste0(mbiemri_paster, ".", emri_paster, "@", sample(domain_et, 1)),
    paste0(emri_paster, "_", mbiemri_paster, "@", sample(domain_et, 1))
  )
  
  return(sample(formatet, 1))
}

cat("  ✓ gjenero_date_kaotike() - 12 formate të ndryshme datash\n")
cat("  ✓ gjenero_emer_kaotik() - 7 variacione kapitalizimi\n")
cat("  ✓ gjenero_adrese_kaotike() - 7 stile adresash\n")
cat("  ✓ gjenero_nid_shqiptar() - Numër ID sintetik\n")
cat("  ✓ gjenero_telefon_kaotik() - 7 formate telefonash\n")
cat("  ✓ gjenero_email() - 6 stile email-esh\n")
cat("\n")

# ==============================================================================
# SEKSIONI 3: GJENERIMI I DATASETIT SINTETIK (50 REKORDE)
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 3: Gjenerimi i datasetit sintetik (50 rekorde)...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# Konfigurimi
nr_rekordeve <- 50
nr_anomalive <- 3

# Inicializo dataframe
te_dhenat_kaotike <- data.frame(
  id_rekordi = character(nr_rekordeve),
  emri_plote = character(nr_rekordeve),
  datelindja_raw = character(nr_rekordeve),
  gjinia = character(nr_rekordeve),
  nid = character(nr_rekordeve),
  adresa = character(nr_rekordeve),
  telefoni = character(nr_rekordeve),
  email = character(nr_rekordeve),
  data_regjistrimit = character(nr_rekordeve),
  flamuri_anomalise = character(nr_rekordeve),
  stringsAsFactors = FALSE
)

# Ruaj të dhënat origjinale për zgjidhjen
te_dhenat_origjinale <- data.frame(
  id_rekordi = character(nr_rekordeve),
  emri = character(nr_rekordeve),
  mbiemri = character(nr_rekordeve),
  datelindja_iso = character(nr_rekordeve),
  gjinia_std = character(nr_rekordeve),
  stringsAsFactors = FALSE
)

# Gjenero çdo rekord
for (i in 1:nr_rekordeve) {
  
  # Përcakto gjininë
  gjinia <- sample(c("M", "F"), 1)
  
  # Zgjidh emrin bazuar në gjini
  if (gjinia == "M") {
    emri <- sample(emrat_meshkuj, 1)
  } else {
    emri <- sample(emrat_femra, 1)
  }
  mbiemri <- sample(mbiemrat, 1)
  
  # Gjenero datëlindjen (mosha 18-85)
  ditet_moshe <- sample(18*365:85*365, 1)
  datelindja <- Sys.Date() - ditet_moshe
  
  # Gjenero datën e regjistrimit (brenda 5 viteve të fundit)
  ditet_reg <- sample(1:1825, 1)
  data_reg <- Sys.Date() - ditet_reg
  
  # Zgjidh qytetin
  qyteti_row <- qytetet[sample(1:nrow(qytetet), 1), ]
  
  # Variacione të gjinisë për kaos
  gjinia_variacionet <- c("M", "F", "Mashkull", "Femër", "m", "f", 
                          "mashkull", "femer", "MASHKULL", "FEMËR", "Male", "Female")
  
  # Plotëso rekordin kaotik
  te_dhenat_kaotike$id_rekordi[i] <- sprintf("REK-%04d", i)
  te_dhenat_kaotike$emri_plote[i] <- gjenero_emer_kaotik(emri, mbiemri)
  te_dhenat_kaotike$datelindja_raw[i] <- gjenero_date_kaotike(datelindja)
  te_dhenat_kaotike$gjinia[i] <- sample(gjinia_variacionet, 1)
  te_dhenat_kaotike$nid[i] <- gjenero_nid_shqiptar(datelindja, gjinia)
  te_dhenat_kaotike$adresa[i] <- gjenero_adrese_kaotike(qyteti_row)
  te_dhenat_kaotike$telefoni[i] <- gjenero_telefon_kaotik()
  te_dhenat_kaotike$email[i] <- gjenero_email(emri, mbiemri)
  te_dhenat_kaotike$data_regjistrimit[i] <- gjenero_date_kaotike(data_reg)
  te_dhenat_kaotike$flamuri_anomalise[i] <- "ASNJË"
  
  # Ruaj të dhënat origjinale
  te_dhenat_origjinale$id_rekordi[i] <- sprintf("REK-%04d", i)
  te_dhenat_origjinale$emri[i] <- emri
  te_dhenat_origjinale$mbiemri[i] <- mbiemri
  te_dhenat_origjinale$datelindja_iso[i] <- format(datelindja, "%Y-%m-%d")
  te_dhenat_origjinale$gjinia_std[i] <- gjinia
}

# Vendos 3 anomali në pozicione rastësore
pozicionet_anomalive <- sample(1:nr_rekordeve, nr_anomalive)

# ANOMALIA 1: Datëlindje në të ardhmen (e pamundur)
pos1 <- pozicionet_anomalive[1]
data_ardhme <- Sys.Date() + sample(100:500, 1)
te_dhenat_kaotike$datelindja_raw[pos1] <- gjenero_date_kaotike(data_ardhme)
te_dhenat_kaotike$flamuri_anomalise[pos1] <- "DATËLINDJE_NË_TË_ARDHMEN"

# ANOMALIA 2: Mosha mbi 120 vjet (e pabesueshme)
pos2 <- pozicionet_anomalive[2]
data_lashte <- as.Date("1890-05-12")
te_dhenat_kaotike$datelindja_raw[pos2] <- gjenero_date_kaotike(data_lashte)
te_dhenat_kaotike$flamuri_anomalise[pos2] <- "MOSHA_MBI_120_VJET"

# ANOMALIA 3: NID nuk përputhet me datëlindjen
pos3 <- pozicionet_anomalive[3]
viti_gabim <- sprintf("%02d", sample(50:99, 1))
te_dhenat_kaotike$nid[pos3] <- paste0(viti_gabim, "0315", sample(0:9, 1), 
                                       sprintf("%03d", sample(1:999, 1)), 
                                       sample(0:9, 1))
te_dhenat_kaotike$flamuri_anomalise[pos3] <- "NID_DATË_MOSPËRPUTHJE"

cat(sprintf("  ✓ U gjeneruan: %d rekorde me formatim kaotik\n", nr_rekordeve))
cat(sprintf("  ✓ U vendosën: %d anomali të fshehura për ushtrim zbulimi\n", nr_anomalive))
cat(sprintf("  ✓ Pozicionet e anomalive: Rekorde %s\n", 
            paste(sprintf("REK-%04d", pozicionet_anomalive), collapse = ", ")))
cat("\n")

# ==============================================================================
# SEKSIONI 4: RUAJTJA E SKEDARËVE TË TË DHËNAVE
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 4: Ruajtja e skedarëve të të dhënave...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# Dataset për pjesëmarrësit (pa flamurin e anomalisë)
te_dhenat_pjesemarres <- te_dhenat_kaotike[, !names(te_dhenat_kaotike) %in% "flamuri_anomalise"]

write.csv(
  te_dhenat_pjesemarres,
  file.path(rruga_aktiviteti, "02_Te_Dhenat", "rekordet_qytetareve_kaotike.csv"),
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
cat("  ✓ [RUAJTUR] 02_Te_Dhenat/rekordet_qytetareve_kaotike.csv\n")

# Dataset me flamuj (për facilitatorin)
write.csv(
  te_dhenat_kaotike,
  file.path(rruga_aktiviteti, "06_Zgjidhjet", "rekordet_me_flamuj.csv"),
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
cat("  ✓ [RUAJTUR] 06_Zgjidhjet/rekordet_me_flamuj.csv\n")

# Çelësi i anomalive
celesi_anomalive <- te_dhenat_kaotike[te_dhenat_kaotike$flamuri_anomalise != "ASNJË", 
                                        c("id_rekordi", "emri_plote", "datelindja_raw", 
                                          "nid", "flamuri_anomalise")]
write.csv(
  celesi_anomalive,
  file.path(rruga_aktiviteti, "06_Zgjidhjet", "celesi_anomalive.csv"),
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
cat("  ✓ [RUAJTUR] 06_Zgjidhjet/celesi_anomalive.csv\n")

# Të dhënat origjinale për zgjidhjen e standardizuar
write.csv(
  te_dhenat_origjinale,
  file.path(rruga_aktiviteti, "06_Zgjidhjet", "te_dhenat_standarde.csv"),
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
cat("  ✓ [RUAJTUR] 06_Zgjidhjet/te_dhenat_standarde.csv\n")

cat("\n")

# ==============================================================================
# SEKSIONI 5: GJENERIMI I PREZANTIMIT BEAMER (LATEX)
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 5: Gjenerimi i prezantimit Beamer (LaTeX)...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

slides_beamer <- r"(% ==============================================================================
% AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE
% AI si Motor Standardizimi
% ==============================================================================
% Kohëzgjatja: 60 minuta
% Audienca: Stafi IT i Gjendjes Civile Shqiptare
% ==============================================================================

\documentclass[aspectratio=169,11pt]{beamer}

% ------------------------------------------------------------------------------
% PAKETAT DHE KONFIGURIMI
% ------------------------------------------------------------------------------
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[albanian]{babel}
\usepackage{lmodern}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{fontawesome5}
\usepackage{tcolorbox}
\usepackage{listings}

% Konfigurimi i temës
\usetheme{Madrid}
\usecolortheme{whale}

% Ngjyrat e personalizuara
\definecolor{govblue}{RGB}{0,51,102}
\definecolor{alertred}{RGB}{204,0,0}
\definecolor{successgreen}{RGB}{0,128,0}
\definecolor{warningyellow}{RGB}{255,193,7}

\setbeamercolor{palette primary}{bg=govblue}
\setbeamercolor{frametitle}{bg=govblue,fg=white}

% Hiq simbolet e navigimit
\setbeamertemplate{navigation symbols}{}

% Footer
\setbeamertemplate{footline}[frame number]

% Konfigurimi i listings
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  backgroundcolor=\color{gray!10}
}

% ------------------------------------------------------------------------------
% FAQJA E TITULLIT
% ------------------------------------------------------------------------------
\title[Aktiviteti 01]{\textbf{SFIDA E KAOSIT TË TË DHËNAVE}}
\subtitle{AI si Motor Standardizimi}
\author{Workshop: AI dhe Dokumentet Biometrike}
\institute{Dita 1 -- Aktiviteti 1 nga 6}
\date{Kohëzgjatja: 60 minuta}

\begin{document}

% Slide titulli
\begin{frame}
\titlepage
\end{frame}

% ------------------------------------------------------------------------------
% OBJEKTIVAT E TË NXËNIT
% ------------------------------------------------------------------------------
\begin{frame}{Objektivat e të Nxënit}
\vspace{0.5cm}
Në fund të këtij aktiviteti, ju do të jeni në gjendje të:

\vspace{0.5cm}

\begin{enumerate}
    \item \textbf{Përdorni AI për të standardizuar} formate të pakonsisueshme datash në ISO 8601
    \item \textbf{Aplikoni pastrimin me ndihmën e AI} për të normalizuar kapitalizimin e emrave
    \item \textbf{Zbuloni anomali të dhënash} duke përdorur prompt-e validimi AI
    \item \textbf{Dokumentoni prompt-e efektive} për ripërdorim në operacionet e përditshme
\end{enumerate}

\vspace{0.5cm}

\begin{tcolorbox}[colback=warningyellow!20,colframe=warningyellow,title=\faIcon{clock} Shpërndarja e Kohës]
\small
Faza A: Demo Facilitatori (10 min) $\rightarrow$ Faza B: Praktikë e Udhëhequr (40 min) $\rightarrow$ Faza C: Debriefing (10 min)
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% PROBLEMI
% ------------------------------------------------------------------------------
\begin{frame}{Problemi: Kaosi i të Dhënave në Terren}

\begin{columns}
\begin{column}{0.5\textwidth}
\textbf{Realiteti Juaj:}
\begin{itemize}
    \item 50+ rekorde qytetarësh mbërrijnë nga dega rajonale
    \item Datat në 5+ formate të ndryshme
    \item Emrat me kapitalizim rastësor
    \item Adresat të shkurtuara në mënyra të ndryshme
    \item Duhet të futen në bazën e të dhënave SOT
\end{itemize}
\end{column}

\begin{column}{0.5\textwidth}
\begin{tcolorbox}[colback=alertred!10,colframe=alertred,title=\faIcon{exclamation-triangle} Shembull Kaosi]
\small
\texttt{15/03/1987}\\
\texttt{Mars 15, 1987}\\
\texttt{1987-03-15}\\
\texttt{15 Mars 1987}\\
\texttt{870315}
\end{tcolorbox}

\vspace{0.3cm}

\textbf{Të gjitha përfaqësojnë TË NJËJTËN datë!}
\end{column}
\end{columns}

\end{frame}

% ------------------------------------------------------------------------------
% ZGJIDHJA
% ------------------------------------------------------------------------------
\begin{frame}{Zgjidhja: AI si Motori Juaj i Standardizimit}

\begin{center}
\begin{tikzpicture}
    % Kutia input
    \node[draw, fill=alertred!20, minimum width=3cm, minimum height=1.5cm, rounded corners] (input) at (0,0) {
        \begin{tabular}{c}
        \textbf{Të Dhëna Kaotike}\\
        \small Formate të përziera
        \end{tabular}
    };
    
    % Kutia AI
    \node[draw, fill=govblue!20, minimum width=3cm, minimum height=1.5cm, rounded corners] (ai) at (5,0) {
        \begin{tabular}{c}
        \textbf{Claude/Gemini}\\
        \small + Prompt-i Juaj
        \end{tabular}
    };
    
    % Kutia output
    \node[draw, fill=successgreen!20, minimum width=3cm, minimum height=1.5cm, rounded corners] (output) at (10,0) {
        \begin{tabular}{c}
        \textbf{Të Dhëna të Pastra}\\
        \small ISO 8601, Title Case
        \end{tabular}
    };
    
    % Shigjetat
    \draw[->, thick] (input) -- (ai);
    \draw[->, thick] (ai) -- (output);
\end{tikzpicture}
\end{center}

\vspace{0.5cm}

\begin{tcolorbox}[colback=successgreen!10,colframe=successgreen,title=\faIcon{check-circle} Pikëpamja Kyçe]
AI shkëlqen në \textbf{detyrat e përsëritura të standardizimit} që do t'u merrnin njerëzve orë të tëra. Detyra juaj është të hartoni udhëzimet e duhura (prompt-et).
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% STANDARDET E SYNUARA
% ------------------------------------------------------------------------------
\begin{frame}{Standardet e Synuara për Regjistrin Civil Shqiptar}

\begin{tabular}{lll}
\toprule
\textbf{Fusha} & \textbf{Shembull Kaotik} & \textbf{Formati i Standardizuar} \\
\midrule
Datëlindja & 15/03/1987 & \textcolor{successgreen}{1987-03-15} (ISO 8601) \\
Emri i Plotë & agron HOXHA & \textcolor{successgreen}{Agron Hoxha} (Title Case) \\
Gjinia & mashkull, Male, m & \textcolor{successgreen}{M} (Shkronjë e vetme) \\
Telefoni & 0682345678 & \textcolor{successgreen}{+355682345678} (E.164) \\
\bottomrule
\end{tabular}

\vspace{0.5cm}

\begin{tcolorbox}[colback=govblue!10,colframe=govblue,title=\faIcon{info-circle} Pse ISO 8601?]
\small
Standardi ndërkombëtar eliminon paqartësinë: A është 03/04/2024 4 Mars apo 3 Prill? \\
Formati ISO 8601 \texttt{VVVV-MM-DD} është i qartë dhe renditet kronologjikisht.
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% DEMO: HARTIMI I PROMPT-IT
% ------------------------------------------------------------------------------
\begin{frame}[fragile]{Demo: Hartimi i Prompt-it Tuaj të Standardizimit}

\begin{tcolorbox}[colback=gray!10,colframe=gray,title=\faIcon{robot} Shembull Prompt-i për Claude/Gemini]
\small
\begin{verbatim}
Kam një skedar CSV me rekorde qytetarësh shqiptarë.
Të dhënat kanë formatim të pakonsisueshëm.

Ju lutem standardizoni sa më poshtë:

1. Konvertoni TË GJITHA datat në formatin ISO 8601 (VVVV-MM-DD)
2. Konvertoni TË GJITHA emrat në Title Case (Agron Hoxha)
3. Konvertoni gjininë në shkronjë të vetme (M ose F)
4. Sinjalizoni çdo rekord me:
   - Datëlindje në të ardhmen (e pamundur)
   - Moshë mbi 120 vjet (e pabesueshme)
   - Fusha të detyrueshme që mungojnë

Rezultati si CSV i pastër me kolonë shënime_validimi.
\end{verbatim}
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% DETYRA JUAJ
% ------------------------------------------------------------------------------
\begin{frame}{Detyra Juaj (40 Minuta)}

\begin{enumerate}
    \item \textbf{Hapni} \texttt{rekordet\_qytetareve\_kaotike.csv} në menaxherin e skedarëve
    
    \item \textbf{Ngarkoni} skedarin në Claude ose Gemini
    
    \item \textbf{Shkruani prompt-e} për të:
    \begin{itemize}
        \item Konvertuar datat në ISO 8601
        \item Standardizuar emrat në Title Case
        \item Normalizuar kodet e gjinisë
        \item Sinjalizuar rekorde anomale
    \end{itemize}
    
    \item \textbf{Eksportoni} datasetin tuaj të pastruar
    
    \item \textbf{Sfidë Bonus:} Gjeni 3 anomalitë e fshehura!
\end{enumerate}

\vspace{0.3cm}

\begin{tcolorbox}[colback=warningyellow!20,colframe=warningyellow,title=\faIcon{trophy} Konkursi]
Pjesëmarrësi i parë që identifikon saktësisht të 3 anomalitë fiton një çmim!
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% TIPET E ANOMALIVE
% ------------------------------------------------------------------------------
\begin{frame}{Tipet e Anomalive për t'u Zbuluar}

Dataseti përmban 3 gabime të fshehura që AI duhet t'i sinjalizojë:

\vspace{0.5cm}

\begin{tabular}{cl}
\faIcon{calendar-times} & \textbf{Tipi 1:} Datëlindje në TË ARDHMEN (e pamundur) \\
\\
\faIcon{user-clock} & \textbf{Tipi 2:} Mosha mbi 120 vjet (e pabesueshme) \\
\\
\faIcon{id-card} & \textbf{Tipi 3:} NID nuk përputhet me modelin e datëlindjes \\
\end{tabular}

\vspace{0.5cm}

\begin{tcolorbox}[colback=govblue!10,colframe=govblue,title=\faIcon{lightbulb} Këshillë Prompt-i]
Pyesni AI: ``Për çdo rekord, verifikoni që datëlindja rezulton në një moshë të vlefshme ndërmjet 0 dhe 120 vjet. Sinjalizoni çdo rekord jashtë këtij diapazoni.''
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% KËSHILLA PËR RAFINIM PROMPT-I
% ------------------------------------------------------------------------------
\begin{frame}{Këshilla për Rafinimin e Prompt-eve}

\begin{columns}
\begin{column}{0.5\textwidth}
\textbf{\textcolor{alertred}{\faIcon{times-circle} Prompt i Dobët:}}
\begin{tcolorbox}[colback=alertred!10,colframe=alertred]
\small
``Pastro këto të dhëna''
\end{tcolorbox}

\vspace{0.3cm}
\textit{Shumë i paqartë -- AI nuk di standardet tuaja}
\end{column}

\begin{column}{0.5\textwidth}
\textbf{\textcolor{successgreen}{\faIcon{check-circle} Prompt i Fortë:}}
\begin{tcolorbox}[colback=successgreen!10,colframe=successgreen]
\small
``Konverto kolonën datëlindja në ISO 8601 (VVVV-MM-DD). Formatet input mund të përfshijnë DD/MM/VVVV, Muaji DD VVVV, ose DD Muaji VVVV.''
\end{tcolorbox}

\vspace{0.3cm}
\textit{Format specifik + shembuj = rezultate më të mira}
\end{column}
\end{columns}

\vspace{0.5cm}

\textbf{Receta për Prompt-e të Mirë:}
\begin{enumerate}
    \item Deklaroni \textbf{formatin input} (çfarë keni)
    \item Deklaroni \textbf{formatin output} (çfarë ju nevojitet)
    \item Jepni \textbf{shembuj} të rasteve kufitare
    \item Specifikoni sjelljen e \textbf{trajtimit të gabimeve}
\end{enumerate}

\end{frame}

% ------------------------------------------------------------------------------
% DISKUTIMI I DEBRIEFING-UT
% ------------------------------------------------------------------------------
\begin{frame}{Diskutimi i Debriefing-ut (10 Minuta)}

\begin{enumerate}
    \item \textbf{Cilat formulime prompt-esh} prodhuan rezultatin më të pastër?
    
    \vspace{0.3cm}
    
    \item \textbf{A i kapi AI} të tri anomalitë e vendosura? Cilat i humbi?
    
    \vspace{0.3cm}
    
    \item \textbf{Si do ta integronit} këtë rrjedhë pune në procesin tuaj të përditshëm të futjes së të dhënave?
    
    \vspace{0.3cm}
    
    \item \textbf{Cilat raste kufitare} do t'ju duhej të trajtonit për të dhëna reale shqiptare?
\end{enumerate}

\vspace{0.5cm}

\begin{tcolorbox}[colback=govblue!10,colframe=govblue,title=\faIcon{save} Veprim]
Dokumentoni prompt-in tuaj më efektiv në Bibliotekën Tuaj Personale të Prompt-eve (Aktiviteti 6)
\end{tcolorbox}

\end{frame}

% ------------------------------------------------------------------------------
% PIKAT KYÇE
% ------------------------------------------------------------------------------
\begin{frame}{Pikat Kyçe}

\begin{enumerate}
    \item \faIcon{robot} \textbf{AI si mjet përputhshmërie:} Zbaton standarde në mënyrë konsistente në shkallë
    
    \vspace{0.3cm}
    
    \item \faIcon{calendar-check} \textbf{ISO 8601:} Standardi ndërkombëtar i datës (VVVV-MM-DD)
    
    \vspace{0.3cm}
    
    \item \faIcon{edit} \textbf{Inxhinieria e prompt-eve:} Udhëzime specifike japin rezultate specifike
    
    \vspace{0.3cm}
    
    \item \faIcon{exclamation-triangle} \textbf{Zbulimi i anomalive:} AI mund të sinjalizojë automatikisht të dhëna të pamundura
\end{enumerate}

\vspace{0.5cm}

\begin{center}
\Large
\textbf{Në vazhdim: Aktiviteti 2 -- Validuesi i të Dhënave ICAO 9303}
\end{center}

\end{frame}

\end{document}
)"

writeLines(slides_beamer, 
           file.path(rruga_aktiviteti, "01_Slides", "A01_slides.tex"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 01_Slides/A01_slides.tex\n")

cat("\n")

# ==============================================================================
# SEKSIONI 6: SHËNIMET E FACILITATORIT
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 6: Gjenerimi i shënimeve të facilitatorit...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

shenimet_facilitatorit <- sprintf('# AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE
## Shënimet e Facilitatorit

---

## PËRMBLEDHJA E AKTIVITETIT

| Elementi | Detajet |
|----------|---------|
| Kohëzgjatja | 60 minuta |
| Dita/Ora | Dita 1, 09:00-10:00 |
| Eksperti Drejtues | Specialisti i Workshop-it |
| Pjesëmarrësit | 15-25 staf IT |
| Rregullimi i Dhomës | Laborator kompjuterësh me akses internet |

---

## LISTA E KONTROLLIT TË MATERIALEVE

Para seancës, verifikoni:

- [ ] Të gjitha laptopët e pjesëmarrësve kanë akses internet
- [ ] Aksesi në Claude.ai ose Gemini i konfirmuar për të gjithë pjesëmarrësit
- [ ] `rekordet_qytetareve_kaotike.csv` i shpërndarë në të gjitha makinat
- [ ] Projektori i lidhur dhe shfaq siç duhet
- [ ] Çmimet gati për konkursin e zbulimit të anomalive
- [ ] Kohëmatësi i dukshëm për tranzicionet e fazave

---

## FAZA A: DEMONSTRIMI I FACILITATORIT (10 MINUTA)

### Minuta 0-2: Hapja Tërheqëse

Filloni me pyetjen: "Sa orë kaluat javën e kaluar duke riformatuar manualisht të dhëna nga zyrat rajonale?"

Përgjigjet e pritura: 2-5 orë tipike. Përdorni këtë për të vendosur pikën e dhimbjes.

### Minuta 2-5: Vizualizimi i Problemit

Shfaqni slide-in që tregon të njëjtën datë në 5 formate të ndryshme. Pyesni pjesëmarrësit të identifikojnë cilat formate kanë hasur në dorëzime aktuale.

Pikat kyçe të bisedës:
- Zyrat rajonale përdorin sisteme të ndryshme
- Formularët letër transkriptohen me preferencat e operatorit
- Migrimet e të dhënave legacy e përkeqësojnë problemin

### Minuta 5-10: Demo Live

1. Hapni Claude.ai në shfletues
2. Ngarkoni datasetin shembull (vetëm 10 rreshtat e parë për demo)
3. Shkruani prompt-in e standardizimit ngadalë që pjesëmarrësit të ndjekin
4. Tregoni përpunimin dhe rezultatin e AI
5. Theksoni sa shpejt u standardizuan 10 rekorde

**Prompt-i Demo për të Përdorur:**
```
Kam rekorde qytetarësh shqiptarë me formate të pakonsisueshme datash.
Ju lutem konvertoni të gjitha datat në kolonën datelindja_raw në ISO 8601 (VVVV-MM-DD).

Formatet input përfshijnë:
- DD/MM/VVVV (Europian)
- Muaji DD, VVVV (Anglisht)
- DD Muaji VVVV (stili shqiptar)
- VVVVMMDD (kompakt)

Muajt shqiptarë: Janar, Shkurt, Mars, Prill, Maj, Qershor, 
Korrik, Gusht, Shtator, Tetor, Nëntor, Dhjetor

Rezultati si CSV me datat e standardizuara.
```

---

## FAZA B: PRAKTIKA E UDHËHEQUR (40 MINUTA)

### Minuta 10-15: Shpërndarja e Detyrave

1. Konfirmoni që të gjithë pjesëmarrësit kanë datasetin e plotë me 50 rekorde
2. Shfaqni listën e detyrave në projektor
3. Njoftoni konkursin e zbulimit të anomalive
4. Nisni kohëmatësin

### Minuta 15-45: Facilitimi Aktiv

Ecni nëpër dhomë vazhdimisht. Probleme të zakonshme për të vëzhguar:

| Problemi | Zgjidhja |
|----------|----------|
| AI nuk kupton emrat shqiptarë të muajve | Sugjeroni të shtoni shembuj: "Mars = March" |
| Formati i rezultatit gabim | Rafinoni prompt-in për të specifikuar rezultat CSV |
| Pjesëmarrësi i bllokuar te formulimi i prompt-it | Tregoni formulime alternative |
| Timeout i AI në dataset të madh | Sugjeroni përpunim në grupe prej 25 |

### Ndjekja e Konkursit:

Kur pjesëmarrësit pretendojnë se kanë gjetur anomali, verifikoni në heshtje kundrejt çelësit të përgjigjeve:

| Rekordi | Tipi i Anomalisë |
|---------|------------------|
| %s | DATËLINDJE_NË_TË_ARDHMEN |
| %s | MOSHA_MBI_120_VJET |
| %s | NID_DATË_MOSPËRPUTHJE |

Pjesëmarrësi i parë që identifikon saktësisht të tre fiton.

### Minuta 45-50: Paralajmërimi i Mbylljes

Jepni paralajmërimin 5-minutësh. Kërkoni pjesëmarrësve të eksportojnë datasetet e tyre të pastruara.

---

## FAZA C: DEBRIEFING NË GRUP (10 MINUTA)

### Minuta 50-55: Ndarja e Prompt-eve

Kërkoni 2-3 vullnetarë të ndajnë prompt-et e tyre më efektive. Shfaqni në projektor.

Nxitje diskutimi:
- "Çfarë e bëri këtë prompt të funksionojë më mirë se përpjekja juaj e parë?"
- "Çfarë do të shtonit për të trajtuar rastet kufitare?"

### Minuta 55-58: Zbulimi i Anomalive

Njoftoni fituesin e konkursit. Zbuloni të tre anomalitë me shpjegime:

1. **Datëlindje në të Ardhmen:** Rekordi tregon datëlindje pas datës së sotme - fizikisht e pamundur
2. **Mosha > 120:** I lindur në 1890 do ta bënte qytetarin 130+ vjeç - e pabesueshme
3. **Mospërputhje NID:** Numrat e identifikimit shqiptar kodojnë vitin e lindjes; ky nuk përputhet

### Minuta 58-60: Veprimi

Kujtojuni pjesëmarrësve të ruajnë prompt-in e tyre më të mirë për Aktivitetin 6 (Ndërtuesi i Bibliotekës së Prompt-eve).

---

## UDHËZUES ZGJIDHJE PROBLEMESH

**Problemi:** AI kthen gabim kur përpunon CSV
**Zgjidhja:** Pjesëmarrësi të kopjojë-ngjisë 20 rreshtat e parë si tekst në vend

**Problemi:** Llogaria Claude/Gemini e pjesëmarrësit nuk funksionon
**Zgjidhja:** Çiftëzohuni me fqinjin; një person shkruan, tjetri vëzhgon

**Problemi:** Gabime konvertimi datash për emrat shqiptarë të muajve
**Zgjidhja:** Shtoni tabelë përkthimi në prompt: "Janar=January, Shkurt=February..."

**Problemi:** Pjesëmarrësit mbarojnë shumë herët
**Zgjidhja:** Sfidojini të shkruajnë një prompt që gjithashtu validon formatet e email-eve

---

## SHËNIME PAS-AKTIVITETI

Regjistroni për përmirësim të vazhdueshëm:
- Numri i pjesëmarrësve që gjetën të 3 anomalitë: ___
- Gabimet më të zakonshme të prompt-eve të vëzhguara: ___
- Modifikime të sugjeruara për dhënien e ardhshme: ___

---

*Shënimet e Facilitatorit Versioni 1.0*
*Gjeneruar: %s*
',
celesi_anomalive$id_rekordi[1],
celesi_anomalive$id_rekordi[2],
celesi_anomalive$id_rekordi[3],
format(Sys.time(), "%%Y-%%m-%%d %%H:%%M:%%S")
)

writeLines(shenimet_facilitatorit,
           file.path(rruga_aktiviteti, "04_Shenimet_Facilitatorit", "A01_shenimet_facilitatorit.md"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 04_Shenimet_Facilitatorit/A01_shenimet_facilitatorit.md\n")

cat("\n")

# ==============================================================================
# SEKSIONI 7: FLETËPALOSJA E PJESËMARRËSVE
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 7: Gjenerimi i fletëpalosjes së pjesëmarrësve...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

fletepalosja <- r"(# AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE
## Fletëpalosja e Pjesëmarrësit

---

## MISIONI JUAJ

Transformoni 50 rekorde kaotike qytetarësh në format të gatshëm për bazën e të dhënave duke përdorur ndihmën e AI.

**Koha:** 60 minuta gjithsej (40 minuta praktikë)

---

## UDHËZIME HAP PAS HAPI

### Hapi 1: Aksesoni të Dhënat Tuaja (2 minuta)
- Gjeni `rekordet_qytetareve_kaotike.csv` në desktop
- Hapeni shkurtimisht për të parë kaosin (data në 5+ formate!)

### Hapi 2: Hapni Asistentin AI (1 minutë)
- Navigoni te claude.ai ose gemini.google.com
- Identifikohuni me kredencialet tuaja

### Hapi 3: Ngarkoni dhe Prompt-oni (5 minuta)
- Ngarkoni skedarin CSV në asistentin tuaj AI
- Shkruani prompt-in tuaj të parë të standardizimit

### Hapi 4: Iteroni dhe Rafinoni (25 minuta)
- Rishikoni rezultatin e AI për gabime
- Rafinoni prompt-in tuaj bazuar në rezultate
- Përpunoni të gjitha transformimet e kërkuara

### Hapi 5: Zbuloni Anomalitë (7 minuta)
- Kërkoni AI të validojë logjikën e të dhënave
- Gjeni 3 rekorde të fshehura të pamundura
- Dokumentoni cilat rekorde janë problematike

---

## STANDARDET E SYNUARA

| Fusha | Formati Kaotik | Formati i Standardizuar |
|-------|----------------|-------------------------|
| Datëlindja | 15/03/1987, Mars 15 1987, etj. | **1987-03-15** (ISO 8601) |
| Emri | agron HOXHA, AGRON hoxha | **Agron Hoxha** (Title Case) |
| Gjinia | mashkull, m, Male, M | **M** ose **F** |
| Telefoni | 0682345678 | **+355682345678** (E.164) |

---

## SHABLLON PROMPT-I FILLESTAR

Kopjoni dhe modifikoni këtë prompt sipas nevojës:

```
Kam një skedar CSV me rekorde qytetarësh shqiptarë.
Kolonat janë: id_rekordi, emri_plote, datelindja_raw, gjinia, nid, 
adresa, telefoni, email, data_regjistrimit

Ju lutem:
1. Konvertoni kolonën "datelindja_raw" në formatin ISO 8601 (VVVV-MM-DD)
   - Muajt shqiptarë: Janar, Shkurt, Mars, Prill, Maj, Qershor,
     Korrik, Gusht, Shtator, Tetor, Nëntor, Dhjetor
2. Standardizoni "emri_plote" në Title Case (Emri Mbiemri)
3. Konvertoni "gjinia" në M ose F

Ktheni rezultatin si CSV.
```

---

## SFIDA BONUS: GJENI ANOMALITË

Dataseti përmban 3 gabime të fshehura. Përdorni AI për t'i zbuluar:

| Tipi | Përshkrimi | Si ta Gjeni |
|------|------------|-------------|
| 🗓️ | Datëlindje në të ardhmen | Kërkoni AI të verifikojë që datat janë para sotit |
| 👴 | Moshë mbi 120 vjet | Kërkoni AI të llogarisë moshën dhe sinjalizojë vlera ekstreme |
| 🆔 | NID nuk përputhet me datën | Kërkoni AI të krahasojë vitin në NID me vitin e datëlindjes |

**Prompt shembull për zbulim anomalish:**
```
Për çdo rekord, llogarit moshën bazuar në datëlindjen dhe datën e sotme.
Sinjalizoni çdo rekord ku:
- Mosha është negative (datëlindje në të ardhmen)
- Mosha mbi 120 vjet
- 2 shifrat e para të NID nuk përputhen me vitin e datëlindjes
```

---

## LISTA E KONTROLLIT TË DORËZIMIT

Para përfundimit, sigurohuni që keni:

- [ ] Datasetin e pastruar me datat ISO 8601
- [ ] Emrat të standardizuar në Title Case
- [ ] Gjinën e normalizuar në M/F
- [ ] Identifikuar të paktën 1 anomali
- [ ] Dokumentuar prompt-in tuaj më efektiv

---

## SHËNIME DHE VËZHGIME

Përdorni këtë hapësirë për të regjistruar prompt-et që funksionuan mirë:

```
Prompt-i im më i mirë:
_________________________________________________
_________________________________________________
_________________________________________________
_________________________________________________

Anomalitë e gjetura:
1. Rekordi: _______ Problemi: _______________________
2. Rekordi: _______ Problemi: _______________________
3. Rekordi: _______ Problemi: _______________________
```

---

*Aktiviteti 01 - Dita 1*
*Workshop: AI dhe Dokumentet Biometrike*
)"

writeLines(fletepalosja,
           file.path(rruga_aktiviteti, "03_Fletepalosjet", "A01_fletepalosja_pjesemarresit.md"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 03_Fletepalosjet/A01_fletepalosja_pjesemarresit.md\n")

cat("\n")

# ==============================================================================
# SEKSIONI 8: UDHËZIMET E USHTRIMEVE
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 8: Gjenerimi i udhëzimeve të ushtrimeve...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

udhezimi_ushtrimeve <- r"(# AKTIVITETI 01: SFIDA E KAOSIT TË TË DHËNAVE
## Udhëzimet e Detajuara të Ushtrimeve

---

## USHTRIMI 1: STANDARDIZIMI I DATAVE (15 minuta)

### Objektivi
Konvertoni të gjitha datat në kolonën `datelindja_raw` në formatin ndërkombëtar ISO 8601.

### Formatet Input që do të Hasni
Dataseti përmban data në këto formate:
- `15/03/1987` - Format DD/MM/VVVV (Europian)
- `03-15-1987` - Format MM-DD-VVVV (Amerikan)
- `1987-03-15` - Format ISO 8601 (tashmë korrekt)
- `15.03.1987` - Format me pika (Europian)
- `March 15, 1987` - Format me emër muaji anglisht
- `15 Mars 1987` - Format me emër muaji shqip
- `15/03/87` - Format me vit të shkurtuar
- `19870315` - Format kompakt pa ndarës

### Formati Output i Kërkuar
```
1987-03-15
```

### Hapat
1. Ngarkoni CSV-në në Claude/Gemini
2. Shkruani prompt që specifikon:
   - Kolonën për t'u transformuar
   - Formatin e kërkuar output
   - Tabelën e përkthimit të muajve shqiptarë
3. Verifikoni rezultatin duke kontrolluar 5-10 rekorde manualisht
4. Rafinoni prompt-in nëse ka gabime

### Prompt Shembull
```
Transformo kolonën "datelindja_raw" në formatin ISO 8601 (VVVV-MM-DD).

Tabela e muajve shqiptarë:
Janar=01, Shkurt=02, Mars=03, Prill=04, Maj=05, Qershor=06,
Korrik=07, Gusht=08, Shtator=09, Tetor=10, Nëntor=11, Dhjetor=12

Merr parasysh që vitin "87" duhet interpretuar si "1987", jo "2087".
```

---

## USHTRIMI 2: NORMALIZIMI I EMRAVE (10 minuta)

### Objektivi
Standardizoni të gjitha emrat në kolonën `emri_plote` në formatin Title Case.

### Problemet që do të Hasni
- `AGRON HOXHA` - Të gjitha shkronja të mëdha
- `agron hoxha` - Të gjitha shkronja të vogla
- `agron HOXHA` - Kapitalizim i përzier
- `AGRON hoxha` - Kapitalizim i kundërt

### Formati Output i Kërkuar
```
Agron Hoxha
```

### Hapat
1. Identifikoni variacionet e kapitalizimit në dataset
2. Shkruani prompt për normalizim
3. Verifikoni që emrat me karaktere speciale shqiptare ruhen

### Prompt Shembull
```
Normalizo kolonën "emri_plote" në Title Case.
- Çdo fjalë fillon me shkronjë të madhe
- Pjesa tjetër e fjalës me shkronja të vogla
- Ruaj karakteret shqiptare: ë, ç
Shembull: "agron HOXHA" → "Agron Hoxha"
```

---

## USHTRIMI 3: STANDARDIZIMI I GJINISË (5 minuta)

### Objektivi
Konvertoni të gjitha vlerat e gjinisë në një shkronjë të vetme (M ose F).

### Variacionet Input
- `M`, `F` - Tashmë standarde
- `m`, `f` - Shkronja të vogla
- `Mashkull`, `Femër` - Fjalë të plota shqip
- `mashkull`, `femer` - Pa theks
- `Male`, `Female` - Fjalë anglisht
- `MASHKULL`, `FEMËR` - Të gjitha të mëdha

### Formati Output i Kërkuar
```
M  (për mashkull)
F  (për femër)
```

### Prompt Shembull
```
Normalizo kolonën "gjinia" në M ose F.
Tabela e konvertimit:
- M, m, Mashkull, mashkull, MASHKULL, Male, male → M
- F, f, Femër, femer, femër, FEMËR, Female, female → F
```

---

## USHTRIMI 4: ZBULIMI I ANOMALIVE (10 minuta)

### Objektivi
Identifikoni 3 rekorde me gabime logjike të pamundura.

### Tipet e Anomalive për t'u Kërkuar

#### Anomalia 1: Datëlindje në të Ardhmen
- Rekord ku datëlindja është PAS datës së sotme
- Fizikisht e pamundur

#### Anomalia 2: Moshë Ekstreme
- Rekord ku mosha e llogaritur mbi 120 vjet
- Statistikisht e pabesueshme

#### Anomalia 3: NID Mospërputhje
- Numri i identifikimit (NID) përmban vitin e lindjes
- 2 shifrat e para duhet të përputhen me vitin e datëlindjes
- Shembull: Lindur 1987 → NID duhet të fillojë me "87"

### Prompt Shembull
```
Për çdo rekord në dataset:

1. Llogarit moshën = (data e sotme - datelindja) në vjet
2. Kontrollo nëse mosha < 0 (datëlindje në të ardhmen)
3. Kontrollo nëse mosha > 120 (e pabesueshme)
4. Kontrollo nëse 2 shifrat e para të NID = 2 shifrat e fundit të vitit të lindjes

Listo të gjithë rekordet me anomali në formatin:
ID | Tipi i Anomalisë | Detajet
```

---

## DORËZIMI I REZULTATEVE

### Skedarët për t'u Ruajtur
1. `rezultati_i_pastruar.csv` - Dataseti i standardizuar
2. `raporti_anomalive.txt` - Lista e rekordeve me probleme

### Kriteret e Suksesit
- [ ] 100% e datave në format ISO 8601
- [ ] 100% e emrave në Title Case
- [ ] 100% e gjinive si M ose F
- [ ] Së paku 1 nga 3 anomalitë e identifikuar

---

*Udhëzimet e Ushtrimeve - Aktiviteti 01*
)"

writeLines(udhezimi_ushtrimeve,
           file.path(rruga_aktiviteti, "05_Ushtrimet", "A01_udhezime_ushtrimesh.md"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 05_Ushtrimet/A01_udhezime_ushtrimesh.md\n")

cat("\n")

# ==============================================================================
# SEKSIONI 9: MATERIALE SHTESË
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SEKSIONI 9: Gjenerimi i materialeve shtesë...\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# Karta e referencës ISO 8601
karta_iso8601 <- r"(# KARTA E REFERENCËS: ISO 8601

## Çfarë është ISO 8601?

ISO 8601 është standardi ndërkombëtar për përfaqësimin e datave dhe kohëve.
Eliminon paqartësinë që krijohet nga formatet e ndryshme lokale.

## Formati Bazë

```
VVVV-MM-DD
```

Ku:
- VVVV = Viti (4 shifra)
- MM = Muaji (2 shifra, 01-12)
- DD = Dita (2 shifra, 01-31)

## Shembuj

| Data | Format ISO 8601 |
|------|-----------------|
| 15 Mars 1987 | 1987-03-15 |
| 1 Janar 2024 | 2024-01-01 |
| 31 Dhjetor 1999 | 1999-12-31 |

## Përparësitë

1. **Pa paqartësi** - 03/04/2024 mund të jetë Mars 4 ose Prill 3, por 2024-03-04 është gjithmonë 4 Mars
2. **Renditje kronologjike** - Skedarët renditen saktësisht sipas datës
3. **Standardi ndërkombëtar** - Kuptohet globalisht
4. **Miqësor për databaza** - Formati standard për SQL

## Kodet e Muajve

| Muaji Shqip | Muaji Anglisht | Kodi |
|-------------|----------------|------|
| Janar | January | 01 |
| Shkurt | February | 02 |
| Mars | March | 03 |
| Prill | April | 04 |
| Maj | May | 05 |
| Qershor | June | 06 |
| Korrik | July | 07 |
| Gusht | August | 08 |
| Shtator | September | 09 |
| Tetor | October | 10 |
| Nëntor | November | 11 |
| Dhjetor | December | 12 |
)"

writeLines(karta_iso8601,
           file.path(rruga_aktiviteti, "07_Materiale_Shtese", "referenca_iso8601.md"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 07_Materiale_Shtese/referenca_iso8601.md\n")

# Biblioteka e prompt-eve
biblioteka_prompteve <- r"(# BIBLIOTEKA E PROMPT-EVE
## Prompt-e të Gatshme për Standardizim të Dhënash

---

## PROMPT 1: Konvertimi i Datave në ISO 8601

```
Kam një dataset CSV me kolonën "{emri_kolones}" që përmban data në formate të ndryshme.

Konverto të gjitha datat në formatin ISO 8601 (VVVV-MM-DD).

Formatet input që mund të hasësh:
- DD/MM/VVVV (shembull: 15/03/1987)
- MM-DD-VVVV (shembull: 03-15-1987)
- DD.MM.VVVV (shembull: 15.03.1987)
- DD Muaji VVVV (shembull: 15 Mars 1987)
- Muaji DD, VVVV (shembull: March 15, 1987)
- VVVVMMDD (shembull: 19870315)
- DD/MM/VV (shembull: 15/03/87)

Tabela e muajve shqiptarë:
Janar=01, Shkurt=02, Mars=03, Prill=04, Maj=05, Qershor=06,
Korrik=07, Gusht=08, Shtator=09, Tetor=10, Nëntor=11, Dhjetor=12

Për vite 2-shifrore (87), interpreto si 19XX nëse > 30, përndryshe 20XX.

Rezultati: CSV me datë të konvertuar.
```

---

## PROMPT 2: Normalizimi i Emrave

```
Normalizo kolonën "{emri_kolones}" në formatin Title Case standard.

Rregullat:
1. Çdo fjalë fillon me shkronjë të madhe
2. Shkronjat e tjera janë të vogla
3. Ruaj karakteret speciale shqiptare (ë, ç)
4. Trajto emrat e përbërë si fjalë të veçanta

Shembuj:
- "AGRON HOXHA" → "Agron Hoxha"
- "agron hoxha" → "Agron Hoxha"
- "agron HOXHA" → "Agron Hoxha"
- "AFËRDITA KASTRATI" → "Afërdita Kastrati"

Rezultati: CSV me emra të normalizuar.
```

---

## PROMPT 3: Standardizimi i Gjinisë

```
Normalizo kolonën "{emri_kolones}" në formatin standard me shkronjë të vetme.

Tabela e konvertimit:
- M, m, Mashkull, mashkull, MASHKULL, Male, male, MALE → M
- F, f, Femër, femër, femer, FEMËR, Female, female, FEMALE → F

Rezultati: CSV me gjini të standardizuar.
```

---

## PROMPT 4: Validimi i Datëlindjeve

```
Për çdo rekord në dataset, valido kolonën "{emri_kolones}" (datëlindja).

Kontrollet:
1. A është data në të ardhmen? (e pamundur)
2. A rezulton mosha mbi 120 vjet? (e pabesueshme)
3. A është formati valid?

Për çdo gabim të gjetur, raporto:
- ID e rekordit
- Vlera problematike
- Tipi i gabimit
- Veprimi i rekomanduar

Rezultati: Listë e rekordeve me probleme.
```

---

## PROMPT 5: Kontrolli i Përputhshmërisë NID

```
Valido që numri i identifikimit (NID) përputhet me datëlindjen.

Rregulli: 2 shifrat e para të NID duhet të jenë 2 shifrat e fundit të vitit të lindjes.

Shembull:
- Datëlindje: 1987-03-15
- NID: 8703150234 ✓ (fillon me 87)
- NID: 9503150234 ✗ (fillon me 95, duhet 87)

Për çdo mospërputhje, raporto:
- ID e rekordit
- Datëlindja
- NID
- Shifrat e pritura vs. aktuale
```

---

*Ruani këtë bibliotekë për përdorim në operacionet e përditshme*
)"

writeLines(biblioteka_prompteve,
           file.path(rruga_aktiviteti, "07_Materiale_Shtese", "biblioteka_prompteve.md"),
           useBytes = TRUE)
cat("  ✓ [RUAJTUR] 07_Materiale_Shtese/biblioteka_prompteve.md\n")

cat("\n")

# ==============================================================================
# RAPORTI PËRFUNDIMTAR
# ==============================================================================

koha_perfundimit <- Sys.time()
koha_ekzekutimit <- difftime(koha_perfundimit, koha_fillimit, units = "secs")

# Numëro skedarët e krijuar
skedaret_krijuar <- list.files(rruga_aktiviteti, recursive = TRUE)

cat("╔══════════════════════════════════════════════════════════════════════════════╗\n")
cat("║                                                                              ║\n")
cat("║   GJENERIMI I MATERIALEVE - PËRFUNDUAR ME SUKSES!                           ║\n")
cat("║                                                                              ║\n")
cat("╚══════════════════════════════════════════════════════════════════════════════╝\n")
cat("\n")
cat(sprintf("  Aktiviteti:           A01 - Sfida e Kaosit të të Dhënave\n"))
cat(sprintf("  Skedarët e krijuar:   %d\n", length(skedaret_krijuar)))
cat(sprintf("  Rekorde në dataset:   %d\n", nr_rekordeve))
cat(sprintf("  Anomali të fshehura:  %d\n", nr_anomalive))
cat(sprintf("  Koha e ekzekutimit:   %.2f sekonda\n", as.numeric(koha_ekzekutimit)))
cat("\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("  SKEDARËT E KRIJUAR:\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("\n")
for (skedar in skedaret_krijuar) {
  cat(sprintf("  📄 %s\n", skedar))
}
cat("\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("  HAPAT E ARDHSHËM:\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("\n")
cat("  1. Kompiloni A01_slides.tex në Overleaf për PDF\n")
cat("  2. Shpërndani rekordet_qytetareve_kaotike.csv te pjesëmarrësit\n")
cat("  3. Printoni fletëpalosjet për pjesëmarrësit\n")
cat("  4. Rishikoni shënimet e facilitatorit\n")
cat("  5. Vazhdoni me Aktivitetin 2\n")
cat("\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("\n")

# ==============================================================================
# FUND I SKRIPTIT
# ==============================================================================
