-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema progetto_hr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema progetto_hr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `progetto_hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `progetto_hr` ;

-- -----------------------------------------------------
-- Table `progetto_hr`.`area_competenza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`area_competenza` (
  `id_area` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_area`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`business`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`business` (
  `id_business` INT NOT NULL AUTO_INCREMENT,
  `business` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_business`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`stato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`stato` (
  `descrizione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`descrizione`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`candidato` (
  `id_candidato` INT NOT NULL AUTO_INCREMENT,
  `cognome` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `anno_di_nascita` INT NOT NULL,
  `num_tel` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mansione` VARCHAR(45) NOT NULL,
  `seniority` VARCHAR(45) NOT NULL,
  `inserimento_azienda` DATE NOT NULL,
  `specializzazione` TEXT NOT NULL,
  `stato` VARCHAR(45) NOT NULL,
  `business` INT NOT NULL,
  `area` INT NOT NULL,
  PRIMARY KEY (`id_candidato`),
  INDEX `stato_idx` (`stato` ASC) VISIBLE,
  INDEX `business_fk_idx` (`business` ASC) VISIBLE,
  INDEX `area_fk_idx` (`area` ASC) VISIBLE,
  CONSTRAINT `area_fk`
    FOREIGN KEY (`area`)
    REFERENCES `progetto_hr`.`area_competenza` (`id_area`),
  CONSTRAINT `business_fk`
    FOREIGN KEY (`business`)
    REFERENCES `progetto_hr`.`business` (`id_business`),
  CONSTRAINT `stato`
    FOREIGN KEY (`stato`)
    REFERENCES `progetto_hr`.`stato` (`descrizione`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`sinonimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`sinonimo` (
  `id_sinonimo` INT NOT NULL AUTO_INCREMENT,
  `sinonimo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sinonimo`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`candidato_sinonimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`candidato_sinonimo` (
  `id_candidato_fk` INT NOT NULL,
  `id_sinonimo_fk` INT NOT NULL,
  INDEX `id_candidato_idx` (`id_candidato_fk` ASC) VISIBLE,
  INDEX `id_competenza_idx` (`id_sinonimo_fk` ASC) VISIBLE,
  CONSTRAINT `id_candidato`
    FOREIGN KEY (`id_candidato_fk`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`),
  CONSTRAINT `id_sinonimo`
    FOREIGN KEY (`id_sinonimo_fk`)
    REFERENCES `progetto_hr`.`sinonimo` (`id_sinonimo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`tipo_feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`tipo_feedback` (
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`feedback` (
  `id_feedback` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `commento` VARCHAR(45) NOT NULL,
  `id_candidato` INT NOT NULL,
  `user_insert` VARCHAR(45) NOT NULL,
  `data_insert` DATE NOT NULL,
  PRIMARY KEY (`id_feedback`),
  INDEX `id_candidato_idx` (`id_candidato` ASC) VISIBLE,
  INDEX `tipo_fb_idx` (`tipo` ASC) VISIBLE,
  CONSTRAINT `id_candidato_fb`
    FOREIGN KEY (`id_candidato`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`),
  CONSTRAINT `tipo_fb`
    FOREIGN KEY (`tipo`)
    REFERENCES `progetto_hr`.`tipo_feedback` (`tipo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`funzionalita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`funzionalita` (
  `id_funzionalita` INT NOT NULL AUTO_INCREMENT,
  `funzionalita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funzionalita`),
  UNIQUE INDEX `funzionalita_UNIQUE` (`funzionalita` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`mansione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`mansione` (
  `id_mansione` INT NOT NULL AUTO_INCREMENT,
  `mansione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_mansione`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '			';


-- -----------------------------------------------------
-- Table `progetto_hr`.`qualification_meeting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`qualification_meeting` (
  `id_qualification` INT NOT NULL AUTO_INCREMENT,
  `data_presentato` DATE NOT NULL,
  `data_colloquio` DATE NOT NULL,
  `commento` VARCHAR(45) NOT NULL,
  `id_candidato` INT NOT NULL,
  `azienda` VARCHAR(45) NOT NULL,
  `ral` INT NOT NULL,
  `preavviso` VARCHAR(45) NOT NULL,
  `desiderata` INT NOT NULL,
  `user_insert` VARCHAR(45) NOT NULL,
  `data_insert` DATE NOT NULL,
  PRIMARY KEY (`id_qualification`),
  INDEX `id_candidato_qm_idx` (`id_candidato` ASC) VISIBLE,
  CONSTRAINT `id_candidato_qm`
    FOREIGN KEY (`id_candidato`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '	';


-- -----------------------------------------------------
-- Table `progetto_hr`.`ruolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`ruolo` (
  `id_ruolo` INT NOT NULL AUTO_INCREMENT,
  `ruolo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ruolo`),
  UNIQUE INDEX `ruolo_UNIQUE` (`ruolo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`ruolo_funzionalita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`ruolo_funzionalita` (
  `id_funzionalita_fk` INT NOT NULL,
  `id_ruolo_fk` INT NOT NULL,
  PRIMARY KEY (`id_funzionalita_fk`, `id_ruolo_fk`),
  INDEX `ruolof_fk_idx` (`id_ruolo_fk` ASC) VISIBLE,
  CONSTRAINT `funzionalita_fk`
    FOREIGN KEY (`id_funzionalita_fk`)
    REFERENCES `progetto_hr`.`funzionalita` (`id_funzionalita`),
  CONSTRAINT `ruolof_fk`
    FOREIGN KEY (`id_ruolo_fk`)
    REFERENCES `progetto_hr`.`ruolo` (`id_ruolo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`utente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`utente` (
  `id_utente` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`ruolo_utente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`ruolo_utente` (
  `id_ruolo_fk` INT NOT NULL AUTO_INCREMENT,
  `id_utente_fk` INT NOT NULL,
  PRIMARY KEY (`id_ruolo_fk`, `id_utente_fk`),
  INDEX `utente_fk_idx` (`id_utente_fk` ASC) VISIBLE,
  CONSTRAINT `ruolo_fk`
    FOREIGN KEY (`id_ruolo_fk`)
    REFERENCES `progetto_hr`.`ruolo` (`id_ruolo`),
  CONSTRAINT `utente_fk`
    FOREIGN KEY (`id_utente_fk`)
    REFERENCES `progetto_hr`.`utente` (`id_utente`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
