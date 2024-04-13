-- Author: Jay Annadurai
-- Date: 12 Apr 2024
-- Project: Pathology DB
-- File: pathology_db_data.sql
-- Desc: Script to inject Data back into the Pathology_db once Django completes Migrations

-- Set the Active Database to Pathology db
USE `Pathology_db`;

-- ----------------
-- TRUNCATE TABLES
-- ----------------
-- Delete all table data but preserve table structure
-- In reverse order of data insertion
-- Must have foreign keys disabled to Truncate Tables
TRUNCATE TABLE Disease_GRF;
TRUNCATE TABLE Disease_ERF;
TRUNCATE TABLE Genetic_Risk_Factor;
TRUNCATE TABLE Environmental_Risk_Factor;
TRUNCATE TABLE Disease;

-- -------------
--  INSERT DATA
-- -------------
INSERT INTO Disease (ID, Name, Abbreviation)
VALUES (1, "Multiple Sclerosis", "MS"),
       (2, "Huntington's Disease", "HD"),
       (3, "Alzheimer's Disease", "AD"),
       (4, "Parkinson's Disease", "PD"),
       (5, "Frontotemporal Dementia", "FTD");

INSERT INTO Genetic_Risk_Factor (ID, SNP, Gene, Trait, P_value)
VALUES (1, "rs150393409-A", "FAN1", "Huntington's disease (age at onset)", 2E-20),
       (2, "rs1232027-?", "LINC01337", "Huntington's disease progression", 1E-10),
       (3, "rs12668183-C", "CRPPA", "Huntington's disease (age at onset)", 2E-8),
       (4, "rs73786719-?", "ADGB", "Huntington's disease progression", 9E-7),
       (5, "rs114688092-?", "KIF9", "Huntington's disease progression", 2E-6),
       (6, "rs3104373-T", "HLA-DQA1", "Multiple sclerosis", 1E-234),
       (7, "rs3135388-A", "HLA-DRB9,HLA-DRA", "Multiple sclerosis", 1E-225),
       (8, "rs3129889-G", "HLA-DRB9, HLA-DRA", "Multiple sclerosis", 1E-206),
       (9, "rs9271366-G", "HLA-DQA1, HLA-DRB1", "Multiple sclerosis", 1E-184),
       (10, "rs10801908-C", "CD58", "Multiple sclerosis", 5E-70),
       (11, "rs814573-?", "APOC1, APOC1P1", "Alzheimer’s disease polygenic risk score", 2E-673),
       (12, "rs429358-?", "APOE", "Alzheimer's disease (age of onset)", 4E-497),
       (13, "rs146275714-?", "NECTIN2", "family history of Alzheimer's disease", 1E-300),
       (14, "rs12691088-?", "APOC1", "family history of Alzheimer's disease", 1E-300),
       (15, "rs2075650-G", "TOMM40", "Alzheimer's disease", 1E-295),
       (16, "rs356182-A", "SNCA", "Parkinson's disease", 4E-170),
       (17, "rs356203-T", "SNCA", "relation to individual with Parkinson's disease", 5E-149),
       (18, "rs34637584-A", "LRRK2", "relation to individual with Parkinson's disease", 4E-148),
       (19, "rs7791726-G", "VWDE, TMEM106B", "Frontotemporal dementia with GRN mutation", 4E-16),
       (20, "rs147211831-?", "MOB3B", "Frontotemporal dementia", 5E-11),
       (21, "rs9268856-C", "HLA-DRB9", "Frontotemporal dementia", 6E-9);

INSERT INTO Environmental_Risk_Factor (ID, Name)
VALUES (1, "Epstein–Barr virus (EBV) Infection"),
       (2, "Stress"),
       (3, "Low Vitamin D"),
       (4, "Heavy Metal Exposure"),
       (5, "Pesticide Exposure");

INSERT INTO Disease_ERF (ERF_ID, Disease_ID, Source_DOI)
VALUES (1, 1, "doi.org/10.1038/s41586-022-04432-7"),
       (2, 2, "doi.org/10.1016/j.neubiorev.2015.03.003"),
       (3, 3, "doi.org/10.1186/s12877-016-0342-y"),
       (4, 4, "doi.org/10.3389/fneur.2019.00218"),
       (5, 5, "doi.org/10.1186/s12877-016-0342-y");

INSERT INTO Disease_GRF (GRF_ID, Disease_ID, Source_Accession)
VALUES (1, 2, "GCST004691"),
       (2, 2, "GCST004691"),
       (3, 2, "GCST004691"),
       (4, 2, "GCST004691"),
       (5, 2, "GCST004691"),
       (6, 1, "GCST003566"),
       (7, 1, "GCST000424"),
       (8, 1, "GCST001341"),
       (9, 1, "GCST000425"),
       (10, 1, "GCST009597"),
       (11, 3, "GCST90132260"),
       (12, 3, "GCST90093287"),
       (13, 3, "GCST90012877"),
       (14, 3, "GCST90012877"),
       (15, 3, "GCST000682"),
       (16, 4, "GCST90308590"),
       (17, 4, "GCST009325"),
       (18, 4, "GCST009325"),
       (19, 5, "GCST006148"),
       (20, 5, "GCST90038470"),
       (21, 5, "GCST002516");