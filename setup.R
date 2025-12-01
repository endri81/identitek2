# ==============================================================================
# WORKSHOP: AI DHE DOKUMENTET BIOMETRIKE
# STRUKTURA E PLOTË E DOSJEVE - SKRIPT PËR EKZEKUTIM LOKAL
# ==============================================================================
#
# Qëllimi:
#   Krijon strukturën e plotë të dosjeve për workshopin 2-ditor (12 orë)
#   me 12 aktivitete praktike për stafin IT të Gjendjes Civile Shqiptare
#
# Përdorimi:
#   1. Hapni RStudio ose R Console
#   2. Vendosni working directory ku dëshironi projektin:
#      setwd("C:/Users/YourName/Documents/Workshop")
#   3. Ekzekutoni: source("workshop_folder_structure.R")
#
# Rezultati:
#   Krijohet dosja "Workshop_AI_Biometrike/" me të gjitha nën-dosjet
#
# Autori: Ekipi i Zhvillimit të Trajnimit
# Versioni: 1.0
# Data: 2024
# ==============================================================================

# Pastroni workspace
rm(list = ls())

# Regjistro kohën e fillimit
koha_fillimit <- Sys.time()

# ==============================================================================
# KONFIGURIMI BAZË
# ==============================================================================

# Emri i dosjes kryesore të projektit
emri_projektit <- "Workshop_AI_Biometrike"

# Rruga e plotë e projektit (në working directory aktual)
rruga_projektit <- file.path(getwd(), emri_projektit)

# ==============================================================================
# METADATA E AKTIVITETEVE (12 aktivitete x 60 minuta)
# ==============================================================================

aktivitetet <- data.frame(
  id = sprintf("A%02d", 1:12),
  dita = rep(1:2, each = 6),
  ora = rep(c("09:00-10:00", "10:00-11:00", "11:00-12:00",
              "13:00-14:00", "14:00-15:00", "15:00-16:00"), 2),
  
  # Titujt e shkurtër për emrat e dosjeve (pa hapësira, pa karaktere speciale)
  titull_dosje = c(
    "Sfida_Kaosit_Datenave",
    "Validuesi_ICAO_9303",
    "Gjuetari_Identiteteve_Dyfishta",
    "Simulimi_Auditit_Paragjykimit",
    "Tribunali_Cilesise_Fotografive",
    "Ndertimi_Asistentit_AI",
    "Autopsia_Dokumenteve_Speciment",
    "Laboratori_Identiteteve_Sintetike",
    "Bootcamp_Zbulimit_Deepfake",
    "Dhoma_Lufte_Shkeljes_Datenave",
    "Auditimi_Perputhshmerise_EU_AI_Act",
    "Ndertimi_Kornizes_Qeverisjes_AI"
  ),
  
  # Titujt e plotë në shqip
  titull_plote = c(
    "Sfida e Kaosit të të Dhënave: AI si Motor Standardizimi",
    "Validuesi i të Dhënave të Pasaportës ICAO 9303",
    "Gjuetari i Identiteteve të Dyfishta: Deduplikimi me AI",
    "Simulimi i Auditit të Paragjykimit Algoritmik",
    "Tribunali i Cilësisë së Fotografive Biometrike",
    "Ndërtimi i Asistentit AI për Zyrën Tuaj",
    "Autopsia e Dokumenteve Speciment: Veçoritë e Sigurisë",
    "Laboratori i Identiteteve Sintetike: Kuptimi i Mashtrimit",
    "Bootcamp i Zbulimit të Deepfake dhe Sulmeve të Prezantimit",
    "Dhoma e Luftës: Simulimi i Reagimit ndaj Shkeljes së të Dhënave",
    "Auditimi i Përputhshmërisë me EU AI Act për Sistemet High-Risk",
    "Ndërtimi i Kornizës së Qeverisjes së AI për Zyrën Tuaj"
  ),
  
  # Eksperti drejtues
  eksperti = c(
    "Specialisti i Workshop-it",
    "Inxhinieri AI",
    "Inxhinieri AI",
    "Inxhinieri AI & Juristi/DPO",
    "Specialisti i Gjendjes Civile",
    "Specialisti i Workshop-it",
    "Arkitekti i Sigurisë Kibernetike",
    "Arkitekti i Sigurisë Kibernetike",
    "Arkitekti i Sigurisë Kibernetike",
    "Arkitekti i Sigurisë & Juristi/DPO",
    "Juristi/DPO",
    "Specialisti i Workshop-it & Juristi/DPO"
  ),
  
  stringsAsFactors = FALSE
)

# ==============================================================================
# FUNKSIONI: Krijo dosje me logging
# ==============================================================================

krijo_dosje <- function(rruga, pershkrimi = "") {
  # Krijon dosje nëse nuk ekziston, me logging në console
  # Argumentet:
  #   rruga: Rruga e plotë e dosjes
  #   pershkrimi: Përshkrim opsional për logging
  # Kthen:
  #   Logjik që tregon sukses/dështim
  
  if (!dir.exists(rruga)) {
    dir.create(rruga, recursive = TRUE, showWarnings = FALSE)
    statusi <- "[KRIJUAR]"
  } else {
    statusi <- "[EKZISTON]"
  }
  
  # Formaton outputin me alignment
  cat(sprintf("  %-12s %s\n", statusi, basename(rruga)))
  
  return(dir.exists(rruga))
}

# ==============================================================================
# FUNKSIONI: Krijo README.md për dosje
# ==============================================================================

krijo_readme <- function(rruga, permbajtja) {
  # Gjeneron file README.md me përmbajtjen e specifikuar
  # Argumentet:
  #   rruga: Rruga e dosjes ku do krijohet README
  #   permbajtja: Vektor karakteresh me linjat e README
  
  readme_path <- file.path(rruga, "README.md")
  writeLines(permbajtja, readme_path, useBytes = TRUE)
}

# ==============================================================================
# FILLIMI I EKZEKUTIMIT
# ==============================================================================

cat("\n")
cat("╔══════════════════════════════════════════════════════════════════════════════╗\n")
cat("║                                                                              ║\n")
cat("║   WORKSHOP: AI DHE DOKUMENTET BIOMETRIKE                                     ║\n
")
cat("║   Krijimi i Strukturës së Dosjeve                                            ║\n")
cat("║                                                                              ║\n")
cat("║   Siguria, Përputhshmëria dhe Cilësia e të Dhënave në Zyrat e Gjendjes       ║\n")
cat("║                                                                              ║\n")
cat("╚══════════════════════════════════════════════════════════════════════════════╝\n")
cat("\n")
cat(sprintf("  Direktoria Punës: %s\n", getwd()))
cat(sprintf("  Projekti:         %s\n", rruga_projektit))
cat(sprintf("  Koha:             %s\n", format(Sys.time(), "%Y-%m-%d %H:%M:%S")))
cat("\n")

# ==============================================================================
# NIVELI 1: Dosja Kryesore e Projektit
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 1: Dosja Kryesore e Projektit\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

krijo_dosje(rruga_projektit)
cat("\n")

# ==============================================================================
# NIVELI 2: Nën-dosjet Kryesore
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 2: Nën-dosjet Kryesore\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

dosjet_kryesore <- c(
  "00_Dokumentacioni_Projektit",
  "01_Dita1_Aktivitetet",
  "02_Dita2_Aktivitetet",
  "03_Burimet_Perbashketa",
  "04_Shabllonet",
  "05_Materialet_Pjesemarresve",
  "06_Udhezimet_Facilitatorit",
  "07_Mjetet_Vleresimit",
  "08_Outputet"
)

for (dosje in dosjet_kryesore) {
  krijo_dosje(file.path(rruga_projektit, dosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Struktura e Dokumentacionit të Projektit
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Dokumentacioni i Projektit\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

dok_nendosje <- c(
  "Pershkrimi_Workshop",
  "Kerkesat_Teknike",
  "Trajnimi_Facilitatoreve",
  "Perputhshmeria_Ligjore",
  "Sigurimi_Cilesise"
)

dok_rruga <- file.path(rruga_projektit, "00_Dokumentacioni_Projektit")
for (nendosje in dok_nendosje) {
  krijo_dosje(file.path(dok_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Dosjet e Aktiviteteve (12 aktivitete)
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Dosjet e Aktiviteteve\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# Struktura e brendshme për çdo aktivitet
aktivitet_nendosje <- c(
  "01_Slides",
  "02_Te_Dhenat",
  "03_Fletepalosjet",
  "04_Shenimet_Facilitatorit",
  "05_Ushtrimet",
  "06_Zgjidhjet",
  "07_Materiale_Shtese",
  "08_Outputet"
)

# Krijon dosjet për të 12 aktivitetet
for (i in 1:nrow(aktivitetet)) {
  
  # Përcakto dosjen e ditës
  dosje_dita <- ifelse(aktivitetet$dita[i] == 1,
                       "01_Dita1_Aktivitetet",
                       "02_Dita2_Aktivitetet")
  
  # Ndërto emrin e dosjes së aktivitetit
  dosje_aktiviteti <- paste0(
    aktivitetet$id[i], "_",
    aktivitetet$titull_dosje[i]
  )
  
  # Rruga e plotë e aktivitetit
  rruga_aktiviteti <- file.path(rruga_projektit, dosje_dita, dosje_aktiviteti)
  
  cat(sprintf("\n  ▶ Aktiviteti %s: %s\n", 
              aktivitetet$id[i], 
              aktivitetet$titull_dosje[i]))
  
  # Krijon dosjen kryesore të aktivitetit
  krijo_dosje(rruga_aktiviteti)
  
  # Krijon nën-dosjet e aktivitetit
  for (nendosje in aktivitet_nendosje) {
    krijo_dosje(file.path(rruga_aktiviteti, nendosje))
  }
  
  # Krijon README.md për aktivitetin
  readme_permbajtja <- c(
    sprintf("# %s", aktivitetet$titull_plote[i]),
    "",
    "## Metadata e Aktivitetit",
    "",
    sprintf("| Element | Vlera |"),
    sprintf("|---------|-------|"),
    sprintf("| **ID Aktiviteti** | %s |", aktivitetet$id[i]),
    sprintf("| **Dita** | %d |", aktivitetet$dita[i]),
    sprintf("| **Ora** | %s |", aktivitetet$ora[i]),
    sprintf("| **Kohëzgjatja** | 60 minuta |"),
    sprintf("| **Eksperti Drejtues** | %s |", aktivitetet$eksperti[i]),
    "",
    "## Përmbajtja e Dosjeve",
    "",
    "| Dosja | Përshkrimi |",
    "|-------|------------|",
    "| 01_Slides | Skedarët e prezantimit (Beamer/PowerPoint) |",
    "| 02_Te_Dhenat | Datasetet sintetike dhe skedarët input |",
    "| 03_Fletepalosjet | Materialet e shpërndara për pjesëmarrësit |",
    "| 04_Shenimet_Facilitatorit | Skriptet e detajuara të facilitmit |",
    "| 05_Ushtrimet | Udhëzimet e ushtrimeve dhe fletët e punës |",
    "| 06_Zgjidhjet | Çelësat e përgjigjeve dhe outputet model |",
    "| 07_Materiale_Shtese | Materiale shtesë referimi |",
    "| 08_Outputet | Outputet e gjeneruara gjatë aktivitetit |",
    "",
    "## Struktura e Aktivitetit",
    "",
    "| Faza | Kohëzgjatja | Përshkrimi |",
    "|------|-------------|------------|",
    "| **Faza A** | 10 minuta | Demonstrimi i facilitatorit |",
    "| **Faza B** | 40 minuta | Praktika e udhëhequr e pjesëmarrësve |",
    "| **Faza C** | 10 minuta | Debriefing dhe diskutim në grup |",
    "",
    "---",
    sprintf("*Gjeneruar: %s*", format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
  )
  
  krijo_readme(rruga_aktiviteti, readme_permbajtja)
}

cat("\n")

# ==============================================================================
# NIVELI 3: Burimet e Përbashkëta
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Burimet e Përbashkëta\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

burime_nendosje <- c(
  "Standardet_ICAO",
  "Referencat_EU_AI_Act",
  "Referencat_GDPR",
  "Formatet_Shqiptare",
  "Udhezimet_Vecorive_Sigurise",
  "Dokumentet_Speciment",
  "Udhezimet_Prompt_Engineering",
  "Ikonat_Grafikat",
  "Emrat_Shqiptare",
  "Listat_Qyteteve"
)

burime_rruga <- file.path(rruga_projektit, "03_Burimet_Perbashketa")
for (nendosje in burime_nendosje) {
  krijo_dosje(file.path(burime_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Shabllonet
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Shabllonet\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

shabllon_nendosje <- c(
  "Shabllonet_Slide",
  "Shabllonet_Datenave",
  "Shabllonet_Raporteve",
  "Shabllonet_Listave_Kontrollit",
  "Shabllonet_Politikave",
  "Shabllonet_Certifikatave"
)

shabllon_rruga <- file.path(rruga_projektit, "04_Shabllonet")
for (nendosje in shabllon_nendosje) {
  krijo_dosje(file.path(shabllon_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Materialet e Pjesëmarrësve
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Materialet e Pjesëmarrësve\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

pjesemarres_nendosje <- c(
  "Materialet_Para_Workshop",
  "Libri_Punes_Dita1",
  "Libri_Punes_Dita2",
  "Paketa_Mjeteve_Perfundimtare",
  "Certifikata"
)

pjesemarres_rruga <- file.path(rruga_projektit, "05_Materialet_Pjesemarresve")
for (nendosje in pjesemarres_nendosje) {
  krijo_dosje(file.path(pjesemarres_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Udhëzimet e Facilitatorit
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Udhëzimet e Facilitatorit\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

facilitator_nendosje <- c(
  "Manuali_Facilitatorit",
  "Skriptet_Demonstrimeve",
  "Udhezimet_Zgjidhjes_Problemeve",
  "Materialet_Rezerve"
)

facilitator_rruga <- file.path(rruga_projektit, "06_Udhezimet_Facilitatorit")
for (nendosje in facilitator_nendosje) {
  krijo_dosje(file.path(facilitator_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# NIVELI 3: Mjetet e Vlerësimit
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("NIVELI 3: Mjetet e Vlerësimit\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

vleresim_nendosje <- c(
  "Vleresimi_Para_Workshop",
  "Vleresimet_Aktiviteteve",
  "Vleresimi_Pas_Workshop",
  "Format_Vleresimit",
  "Matrica_Kompetencave"
)

vleresim_rruga <- file.path(rruga_projektit, "07_Mjetet_Vleresimit")
for (nendosje in vleresim_nendosje) {
  krijo_dosje(file.path(vleresim_rruga, nendosje))
}
cat("\n")

# ==============================================================================
# SKEDARËT E PROJEKTIT
# ==============================================================================

cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("SKEDARËT E PROJEKTIT: Krijimi i skedarëve të konfigurimit\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

# ------------------------------------------------------------------------------
# README.md kryesor
# ------------------------------------------------------------------------------

readme_kryesor <- c(
  "# Workshop: AI dhe Dokumentet Biometrike",
  "",
  "## Zotërimi i Sigurisë, Përputhshmërisë dhe Cilësisë së të Dhënave në Zyrat e Gjendjes Civile",
  "",
  "---",
  "",
  "### Përmbledhje e Workshop-it",
  "",
  "Ky repozitor përmban të gjitha materialet instruksionale për një workshop 2-ditor",
  "(12 orë) praktik i projektuar për stafin IT të Gjendjes Civile Shqiptare që merret",
  "me përpunimin e dokumenteve biometrike dhe operacionet e regjistrit civil.",
  "",
  "### Audienca e Synuar",
  "",
  "- Personeli i zyrave shtetërore",
  "- Oficerët e regjistrimit",
  "- Supervizorët lokalë",
  "- Stafi i mbështetjes IT",
  "",
  "### Struktura e Workshop-it",
  "",
  "| Dita | Fokusi | Aktivitetet |",
  "|------|--------|-------------|",
  "| Dita 1 | Cilësia e të Dhënave, Standardizimi & Validimi | A01-A06 |",
  "| Dita 2 | Siguria, Zbulimi i Mashtrimit & Reagimi ndaj Incidenteve | A07-A12 |",
  "",
  "### Lista e Aktiviteteve",
  "",
  "#### Dita 1: Cilësia e të Dhënave, Standardizimi & Validimi",
  "",
  "| ID | Ora | Titulli |",
  "|----|-----|---------|",
  "| A01 | 09:00-10:00 | Sfida e Kaosit të të Dhënave: AI si Motor Standardizimi |",
  "| A02 | 10:00-11:00 | Validuesi i të Dhënave të Pasaportës ICAO 9303 |",
  "| A03 | 11:00-12:00 | Gjuetari i Identiteteve të Dyfishta: Deduplikimi me AI |",
  "| A04 | 13:00-14:00 | Simulimi i Auditit të Paragjykimit Algoritmik |",
  "| A05 | 14:00-15:00 | Tribunali i Cilësisë së Fotografive Biometrike |",
  "| A06 | 15:00-16:00 | Ndërtimi i Asistentit AI për Zyrën Tuaj |",
  "",
  "#### Dita 2: Siguria, Zbulimi i Mashtrimit & Reagimi ndaj Incidenteve",
  "",
  "| ID | Ora | Titulli |",
  "|----|-----|---------|",
  "| A07 | 09:00-10:00 | Autopsia e Dokumenteve Speciment: Veçoritë e Sigurisë |",
  "| A08 | 10:00-11:00 | Laboratori i Identiteteve Sintetike: Kuptimi i Mashtrimit |",
  "| A09 | 11:00-12:00 | Bootcamp i Zbulimit të Deepfake dhe Sulmeve të Prezantimit |",
  "| A10 | 13:00-14:00 | Dhoma e Luftës: Simulimi i Reagimit ndaj Shkeljes së të Dhënave |",
  "| A11 | 14:00-15:00 | Auditimi i Përputhshmërisë me EU AI Act për Sistemet High-Risk |",
  "| A12 | 15:00-16:00 | Ndërtimi i Kornizës së Qeverisjes së AI për Zyrën Tuaj |",
  "",
  "### Struktura e Dosjeve",
  "",
  "```",
  "Workshop_AI_Biometrike/",
  "├── 00_Dokumentacioni_Projektit/    # Dokumentet e planifikimit dhe administrimit",
  "├── 01_Dita1_Aktivitetet/           # Aktivitetet A01-A06",
  "├── 02_Dita2_Aktivitetet/           # Aktivitetet A07-A12",
  "├── 03_Burimet_Perbashketa/         # Materialet e referencës së përbashkët",
  "├── 04_Shabllonet/                  # Shabllonet e ripërdorshme",
  "├── 05_Materialet_Pjesemarresve/    # Librat e punës dhe fletepalosjet",
  "├── 06_Udhezimet_Facilitatorit/     # Dokumentacioni i trajnerit",
  "├── 07_Mjetet_Vleresimit/           # Instrumentet e vlerësimit",
  "└── 08_Outputet/                    # Outputet e gjeneruara të workshop-it",
  "```",
  "",
  "### Kërkesat Teknike",
  "",
  "- Laptop me akses në internet",
  "- Akses në Claude ose Gemini AI",
  "- Shfletues modern web",
  "- Lexues PDF",
  "- R dhe RStudio (opsionale, për gjenerimin e materialeve)",
  "",
  "### Parimet Kryesore",
  "",
  "1. **Zero Parakusht Matematikor** - Të gjitha konceptet shpjegohen përmes analogjive",
  "2. **I Orientuar nga Detyrat** - Fokus në detyrat e përditshme operative",
  "3. **I Përqendruar te Ligji & Etika** - Përputhshmëria me EU AI Act dhe GDPR e integruar",
  "4. **Angazhim Maksimal** - Aktivitete interaktive, të bazuara në kompjuter",
  "",
  "---",
  "",
  "*Materialet e workshop-it të zhvilluara për Trajnimin e Stafit IT të Qeverisë Shqiptare*",
  "",
  sprintf("*Gjeneruar: %s*", format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
)

writeLines(readme_kryesor, file.path(rruga_projektit, "README.md"), useBytes = TRUE)
cat("  [KRIJUAR] README.md\n")

# ------------------------------------------------------------------------------
# Metadata e aktiviteteve CSV
# ------------------------------------------------------------------------------

write.csv(
  aktivitetet,
  file.path(rruga_projektit, "00_Dokumentacioni_Projektit", "metadata_aktiviteteve.csv"),
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
cat("  [KRIJUAR] 00_Dokumentacioni_Projektit/metadata_aktiviteteve.csv\n")

# ------------------------------------------------------------------------------
# .gitignore
# ------------------------------------------------------------------------------

gitignore_permbajtja <- c(
  "# R specifike",
  ".Rhistory",
  ".Rdata",
  ".Ruserdata",
  ".RData",
  "",
  "# Skedarët output",
  "08_Outputet/*",
  "!08_Outputet/.gitkeep",
  "**/08_Outputet/*",
  "",
  "# Skedarët e përkohshëm",
  "*.tmp",
  "*~",
  "*.log",
  "",
  "# OS specifike",
  ".DS_Store",
  "Thumbs.db",
  "",
  "# Të dhëna sensitive",
  "**/sensitive/",
  "**/private/",
  "**/konfidenciale/"
)

writeLines(gitignore_permbajtja, file.path(rruga_projektit, ".gitignore"))
cat("  [KRIJUAR] .gitignore\n")

# ------------------------------------------------------------------------------
# R Project file
# ------------------------------------------------------------------------------

rproj_permbajtja <- c(
  "Version: 1.0",
  "",
  "RestoreWorkspace: Default",
  "SaveWorkspace: Default",
  "AlwaysSaveHistory: Default",
  "",
  "EnableCodeIndexing: Yes",
  "UseSpacesForTab: Yes",
  "NumSpacesForTab: 2",
  "Encoding: UTF-8",
  "",
  "RnwWeave: Sweave",
  "LaTeX: pdfLaTeX"
)

writeLines(rproj_permbajtja, 
           file.path(rruga_projektit, "Workshop_AI_Biometrike.Rproj"))
cat("  [KRIJUAR] Workshop_AI_Biometrike.Rproj\n")

# ------------------------------------------------------------------------------
# Ruaj metadata si RDS për skriptet downstream
# ------------------------------------------------------------------------------

saveRDS(
  aktivitetet,
  file.path(rruga_projektit, "00_Dokumentacioni_Projektit", "metadata_aktiviteteve.rds")
)
cat("  [KRIJUAR] 00_Dokumentacioni_Projektit/metadata_aktiviteteve.rds\n")

# Ruaj konfigurimin e projektit
konfigurimi <- list(
  rruga_projektit = rruga_projektit,
  numri_aktiviteteve = nrow(aktivitetet),
  ditet_workshop = 2,
  gjuha = "shqip",
  krijuar = Sys.time()
)

saveRDS(
  konfigurimi,
  file.path(rruga_projektit, "00_Dokumentacioni_Projektit", "konfigurimi_projektit.rds")
)
cat("  [KRIJUAR] 00_Dokumentacioni_Projektit/konfigurimi_projektit.rds\n")

cat("\n")

# ==============================================================================
# RAPORTI PËRFUNDIMTAR
# ==============================================================================

# Numëro dosjet e krijuara
numro_dosjet <- function(rruga) {
  length(list.dirs(rruga, recursive = TRUE)) - 1
}

totali_dosjeve <- numro_dosjet(rruga_projektit)
koha_perfundimit <- Sys.time()
koha_ekzekutimit <- difftime(koha_perfundimit, koha_fillimit, units = "secs")

cat("╔══════════════════════════════════════════════════════════════════════════════╗\n")
cat("║                                                                              ║\n")
cat("║   KRIJIMI I STRUKTURËS SË DOSJEVE - PËRFUNDUAR ME SUKSES!                   ║\n")
cat("║                                                                              ║\n")
cat("╚══════════════════════════════════════════════════════════════════════════════╝\n")
cat("\n")
cat(sprintf("  Rruga e Projektit:     %s\n", rruga_projektit))
cat(sprintf("  Totali i Dosjeve:      %d\n", totali_dosjeve))
cat(sprintf("  Totali i Aktiviteteve: %d\n", nrow(aktivitetet)))
cat(sprintf("  Ditët e Mbuluara:      %d\n", 2))
cat(sprintf("  Gjuha:                 Shqip\n"))
cat(sprintf("  Koha e Ekzekutimit:    %.2f sekonda\n", as.numeric(koha_ekzekutimit)))
cat("\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("  HAPAT E ARDHSHËM:\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("\n")
cat("  1. Ekzekutoni skriptin e gjenerimit të materialeve për Aktivitetin 1\n")
cat("  2. Kompiloni slides-et LaTeX/Beamer në Overleaf\n")
cat("  3. Plotësoni materialet mbështetëse për çdo aktivitet\n")
cat("  4. Rishikoni dhe validoni të gjitha materialet para trajnimit\n")
cat("\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("\n")

# ==============================================================================
# FUND I SKRIPTIT
# ==============================================================================
