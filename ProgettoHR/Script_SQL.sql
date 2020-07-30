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
  PRIMARY KEY (`id_candidato`),
  INDEX `stato_idx` (`stato` ASC) VISIBLE,
  CONSTRAINT `stato`
    FOREIGN KEY (`stato`)
    REFERENCES `progetto_hr`.`stato` (`descrizione`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
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
-- caricamento in table stato
-- -----------------------------------------------------
INSERT INTO `progetto_hr`.`stato` (`descrizione`) VALUES ('nuovo_inserito');
INSERT INTO `progetto_hr`.`stato` (`descrizione`) VALUES ('da_contattare');
INSERT INTO `progetto_hr`.`stato` (`descrizione`) VALUES ('scartato');
INSERT INTO `progetto_hr`.`stato` (`descrizione`) VALUES ('attivo');
INSERT INTO `progetto_hr`.`stato` (`descrizione`) VALUES ('selezionato');


-- -----------------------------------------------------
-- caricamento in table tipo_feedback
-- -----------------------------------------------------
INSERT INTO `progetto_hr`.`tipo_feedback` (`tipo`) VALUES ('chat');
INSERT INTO `progetto_hr`.`tipo_feedback` (`tipo`) VALUES ('colloquio_hr');
INSERT INTO `progetto_hr`.`tipo_feedback` (`tipo`) VALUES ('colloquio_tecnico');
INSERT INTO `progetto_hr`.`tipo_feedback` (`tipo`) VALUES ('mail');
INSERT INTO `progetto_hr`.`tipo_feedback` (`tipo`) VALUES ('telefonata');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
