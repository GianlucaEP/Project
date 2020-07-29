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
  `inserimento_azienda` DATE NOT NULL,
  `competenza` TEXT NOT NULL,
  PRIMARY KEY (`id_candidato`))
ENGINE = InnoDB
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
-- Table `progetto_hr`.`colloquio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`colloquio` (
  `id_colloquio` INT NOT NULL AUTO_INCREMENT,
  `id_candidato` INT NOT NULL,
  `data` DATE NOT NULL,
  `operatore` VARCHAR(45) NOT NULL,
  `commento` TEXT NOT NULL,
  PRIMARY KEY (`id_colloquio`),
  INDEX `id_candidato_colloquio_idx` (`id_candidato` ASC) VISIBLE,
  CONSTRAINT `id_candidato_colloquio`
    FOREIGN KEY (`id_candidato`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '		';


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
-- Table `progetto_hr`.`telefonata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progetto_hr`.`telefonata` (
  `id_telefonata` INT NOT NULL AUTO_INCREMENT,
  `id_candidato` INT NOT NULL,
  `data` DATE NOT NULL,
  `operatore` VARCHAR(45) NOT NULL,
  `commento` TEXT NOT NULL,
  PRIMARY KEY (`id_telefonata`),
  INDEX `id_candidato_idx` (`id_candidato` ASC) VISIBLE,
  CONSTRAINT `id_candidato_telefonata`
    FOREIGN KEY (`id_candidato`)
    REFERENCES `progetto_hr`.`candidato` (`id_candidato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
