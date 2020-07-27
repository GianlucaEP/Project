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
  `contatto` TINYINT(1) NOT NULL,
  `commento_contatto` VARCHAR(45) NOT NULL,
  `colloquio` DATE NOT NULL,
  `commento_colloquio` VARCHAR(45) NOT NULL,
  `da_ricontattare` VARCHAR(45) NOT NULL,
  `qualification_meeting` VARCHAR(45) NOT NULL,
  `azienda_qm` VARCHAR(45) NOT NULL,
  `commento_qm` VARCHAR(45) NOT NULL,
  `in` DATE NOT NULL,
  PRIMARY KEY (`id_candidato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`competenza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`competenza` (
  `id_competenza` INT NOT NULL AUTO_INCREMENT,
  `specializzazione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_competenza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `progetto_hr`.`candidato_competenza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`candidato_competenza` (
  `id_candidato_fk` INT NOT NULL,
  `id_competenza_fk` INT NOT NULL,
  INDEX `id_candidato_idx` (`id_candidato_fk` ASC) VISIBLE,
  INDEX `id_competenza_idx` (`id_competenza_fk` ASC) VISIBLE,
  CONSTRAINT `id_candidato`
    FOREIGN KEY (`id_candidato_fk`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`),
  CONSTRAINT `id_competenza`
    FOREIGN KEY (`id_competenza_fk`)
    REFERENCES `progetto_hr`.`competenza` (`id_competenza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
