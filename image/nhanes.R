hdps.data <- readRDS("C:/Users/Ehsan/Documents/GitHub/CrossFitSplit/update for SSC/data/analyticCoded.RDS")
hdps.data10 <- subset(hdps.data, year == "10")
hdps.data10$year <- NULL

# careful as some factor variables exist
investigator.specified.factor.list <- c("age.cat", "sex", 
                                        "education", "race", "marital", "income", 
                                        "born", "diabetes.family.history", 
                                        "medical.access", "smoking", 
                                        "diet.healthy", "physical.activity", 
                                        "high.cholesterol")

investigator.specified.numeric.list <- c("sleep", "uric.acid", 
                                         "protein.total", "bilirubin.total", 
                                         "phosphorus", "sodium", "potassium", 
                                         "globulin", "calcium.total", 
                                         "systolicBP", "diastolicBP")

proxy.list <- c("rec_dx_I10_once", "rec_dx_R73_once", 
                "rec_dx_I10_frequent", "rec_dx_R60_once", "rec_dx_E78_once", 
                "rec_dx_M79_once", "rec_dx_E87_once", "rec_dx_I51_once", "rec_dx_I50_once", 
                "rec_dx_D75_once", "rec_dx_K21_once", "rec_dx_Z79_once", "rec_dx_N28_once", 
                "rec_dx_F41_once", "rec_dx_E79_once", "rec_dx_M10_once", "rec_dx_M1A_once", 
                "rec_dx_L70_once", "rec_dx_F32_once", "rec_dx_I80_once", "rec_dx_F90_once", 
                "rec_dx_F43_once", "rec_dx_I50_frequent", "rec_dx_B00_once", 
                "rec_dx_R12_once", "rec_dx_N19_once", "rec_dx_B20_once", "rec_dx_E28_frequent", 
                "rec_dx_R07_once", "rec_dx_M19_once", "rec_dx_I48_once", "rec_dx_G47_once", 
                "rec_dx_T14_once", "rec_dx_I70_once", "rec_dx_M06_once", "rec_dx_N40_once", 
                "rec_dx_R51_once", "rec_dx_R21_once", "rec_dx_J45_once", "rec_dx_H40_once", 
                "rec_dx_K31_once", "rec_dx_I63_once", "rec_dx_H10_once", "rec_dx_R52_once", 
                "rec_dx_R19_once", "rec_dx_N95_once", "rec_dx_K92_once", "rec_dx_J20_once", 
                "rec_dx_E28_once", "rec_dx_R32_once", "rec_dx_M13_once", "rec_dx_G30_once", 
                "rec_dx_J98_once", "rec_dx_N52_once", "rec_dx_I49_once", "rec_dx_N30_once", 
                "rec_dx_N42_once", "rec_dx_R39_once", "rec_dx_N92_once", "rec_dx_B96_once", 
                "rec_dx_H40_frequent", "rec_dx_M54_once", "rec_dx_K59_once", 
                "rec_dx_G25_once", "rec_dx_F31_once", "rec_dx_T78_once", "rec_dx_R41_once", 
                "rec_dx_G31_once", "rec_dx_I99_once", "rec_dx_G30_frequent", 
                "rec_dx_C50_once", "rec_dx_F39_once", "rec_dx_R06_once", "rec_dx_F17_once", 
                "rec_dx_K30_once", "rec_dx_R45_once", "rec_dx_K25_once", "rec_dx_B37_once", 
                "rec_dx_L08_once", "rec_dx_T88_once", "rec_dx_J42_once", "rec_dx_R10_once", 
                "rec_dx_M06_frequent", "rec_dx_G20_once", "rec_dx_E07_once", 
                "rec_dx_K58_once", "rec_dx_R35_once", "rec_dx_K04_once", "rec_dx_R05_once", 
                "rec_dx_K08_once", "rec_dx_I20_once", "rec_dx_H57_once", "rec_dx_R25_once", 
                "rec_dx_H66_once", "rec_dx_R42_once", "rec_dx_B20_frequent", 
                "rec_dx_I48_frequent", "rec_dx_M62_once", "rec_dx_G43_once", 
                "rec_dx_F29_once", "rec_dx_J45_frequent", "rec_dx_L23_once", 
                "rec_dx_A49_once", "rec_dx_R09_once", "rec_dx_J30_once", "rec_dx_K76_once", 
                "rec_dx_Z95_once", "rec_dx_J01_once", "rec_dx_J40_once", "rec_dx_H57_frequent", 
                "rec_dx_G89_once", "rec_dx_J44_once", "rec_dx_F31_frequent", 
                "rec_dx_J43_once", "rec_dx_I21_once", "rec_dx_L20_once", "rec_dx_L40_once", 
                "rec_dx_N94_once", "rec_dx_G20_frequent", "rec_dx_M25_once", 
                "rec_dx_M81_once", "rec_dx_L93_once", "rec_dx_E03_once", "rec_dx_F20_frequent", 
                "rec_dx_J43_frequent", "rec_dx_E05_once", "rec_dx_L93_frequent", 
                "rec_dx_L29_once", "rec_dx_R00_once", "rec_dx_E04_once", "rec_dx_G40_once", 
                "rec_dx_J44_frequent", "rec_dx_E29_once", "rec_dx_N39_once", 
                "rec_dx_F20_once", "rec_dx_N20_once", "rec_dx_J02_once", "rec_dx_K27_once", 
                "rec_dx_N32_once", "rec_dx_H04_once", "rec_dx_B35_once", "rec_dx_R11_once")

SL.library <- c("SL.glm", 
                "SL.earth", 
                "SL.glmnet")

n.fd <- nrow(hdps.data10)

covarsT <- c(investigator.specified.factor.list,
             investigator.specified.numeric.list, 
             proxy.list)

covarsO <- covarsT

outcome <- "diabetes"

exposure <- "obese" 


hdps.data11 <- hdps.data10

hdps.data11$diabetes <- as.numeric(hdps.data10$diabetes)-1
hdps.data11$obese <- as.numeric(hdps.data10$obese)-1

saveRDS(hdps.data11, file = "data/diabetes_data.rds")