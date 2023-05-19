-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital_senac_humberto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital_senac_humberto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital_senac_humberto` DEFAULT CHARACTER SET utf8 ;
USE `hospital_senac_humberto` ;

-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`especialidade` (
  `idespecialidade` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`especialidade_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`especialidade_medico` (
  `medico_idmedico` INT NOT NULL,
  `especialidade_idespecialidade` INT NOT NULL,
  INDEX `fk_especialidade_medico_medico_idx` (`medico_idmedico` ASC) VISIBLE,
  PRIMARY KEY (`especialidade_idespecialidade`),
  CONSTRAINT `fk_especialidade_medico_medico`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `hospital_senac_humberto`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_especialidade_medico_especialidade1`
    FOREIGN KEY (`especialidade_idespecialidade`)
    REFERENCES `hospital_senac_humberto`.`especialidade` (`idespecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`convenio` (
  `idconvenio` INT NOT NULL AUTO_INCREMENT,
  `nome_convenio` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `carencia` DATE NOT NULL,
  `carteira_convenio` INT NOT NULL,
  PRIMARY KEY (`idconvenio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`pacientes` (
  `idpacientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimetno` DATE NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cpf` INT NOT NULL,
  `rg` INT NOT NULL,
  `convenio_idconvenio` INT NOT NULL,
  PRIMARY KEY (`idpacientes`),
  INDEX `fk_pacientes_convenio1_idx` (`convenio_idconvenio` ASC) VISIBLE,
  CONSTRAINT `fk_pacientes_convenio1`
    FOREIGN KEY (`convenio_idconvenio`)
    REFERENCES `hospital_senac_humberto`.`convenio` (`idconvenio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`consulta` (
  `idconsulta` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL NOT NULL,
  `date` DATE NOT NULL,
  `especialidade_idespecialidade` INT NOT NULL,
  `convenio_idconvenio` INT NOT NULL,
  `medico_idmedico1` INT NOT NULL,
  `pacientes_idpacientes` INT NOT NULL,
  PRIMARY KEY (`idconsulta`),
  INDEX `fk_consulta_especialidade1_idx` (`especialidade_idespecialidade` ASC) VISIBLE,
  INDEX `fk_consulta_convenio1_idx` (`convenio_idconvenio` ASC) VISIBLE,
  INDEX `fk_consulta_medico2_idx` (`medico_idmedico1` ASC) VISIBLE,
  INDEX `fk_consulta_pacientes1_idx` (`pacientes_idpacientes` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_especialidade1`
    FOREIGN KEY (`especialidade_idespecialidade`)
    REFERENCES `hospital_senac_humberto`.`especialidade` (`idespecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_convenio1`
    FOREIGN KEY (`convenio_idconvenio`)
    REFERENCES `hospital_senac_humberto`.`convenio` (`idconvenio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medico2`
    FOREIGN KEY (`medico_idmedico1`)
    REFERENCES `hospital_senac_humberto`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_pacientes1`
    FOREIGN KEY (`pacientes_idpacientes`)
    REFERENCES `hospital_senac_humberto`.`pacientes` (`idpacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`receita` (
  `idreceital` INT NOT NULL AUTO_INCREMENT,
  `medicamentos` VARCHAR(45) NOT NULL,
  `consulta_idconsulta` INT NOT NULL,
  PRIMARY KEY (`idreceital`),
  INDEX `fk_receita_consulta1_idx` (`consulta_idconsulta` ASC) VISIBLE,
  CONSTRAINT `fk_receita_consulta1`
    FOREIGN KEY (`consulta_idconsulta`)
    REFERENCES `hospital_senac_humberto`.`consulta` (`idconsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`tipo_quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`tipo_quarto` (
  `idtipo_quarto` INT NOT NULL AUTO_INCREMENT,
  `descriao` VARCHAR(45) NULL,
  `valor_diaria` REAL NOT NULL,
  PRIMARY KEY (`idtipo_quarto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`quarto` (
  `idquarto` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `tipo_quarto_idtipo_quarto` INT NOT NULL,
  PRIMARY KEY (`idquarto`),
  INDEX `fk_quarto_tipo_quarto1_idx` (`tipo_quarto_idtipo_quarto` ASC) VISIBLE,
  CONSTRAINT `fk_quarto_tipo_quarto1`
    FOREIGN KEY (`tipo_quarto_idtipo_quarto`)
    REFERENCES `hospital_senac_humberto`.`tipo_quarto` (`idtipo_quarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`internacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`internacao` (
  `idinternacao` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `data_previa` DATE NULL,
  `data_alta` DATE NOT NULL,
  `procedimento` VARCHAR(45) NOT NULL,
  `quarto_idquarto` INT NOT NULL,
  `medico_idmedico` INT NOT NULL,
  `pacientes_idpacientes` INT NOT NULL,
  PRIMARY KEY (`idinternacao`),
  INDEX `fk_internacao_quarto1_idx` (`quarto_idquarto` ASC) VISIBLE,
  INDEX `fk_internacao_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
  INDEX `fk_internacao_pacientes1_idx` (`pacientes_idpacientes` ASC) VISIBLE,
  CONSTRAINT `fk_internacao_quarto1`
    FOREIGN KEY (`quarto_idquarto`)
    REFERENCES `hospital_senac_humberto`.`quarto` (`idquarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internacao_medico1`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `hospital_senac_humberto`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internacao_pacientes1`
    FOREIGN KEY (`pacientes_idpacientes`)
    REFERENCES `hospital_senac_humberto`.`pacientes` (`idpacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`enfermeiro` (
  `idenfermeiro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `cre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idenfermeiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_senac_humberto`.`internacao_enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_senac_humberto`.`internacao_enfermeiro` (
  `internacao_idinternacao` INT NOT NULL,
  `enfermeiro_idenfermeiro` INT NOT NULL,
  INDEX `fk_internacao_enfermeiro_internacao1_idx` (`internacao_idinternacao` ASC) VISIBLE,
  INDEX `fk_internacao_enfermeiro_enfermeiro1_idx` (`enfermeiro_idenfermeiro` ASC) VISIBLE,
  CONSTRAINT `fk_internacao_enfermeiro_internacao1`
    FOREIGN KEY (`internacao_idinternacao`)
    REFERENCES `hospital_senac_humberto`.`internacao` (`idinternacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internacao_enfermeiro_enfermeiro1`
    FOREIGN KEY (`enfermeiro_idenfermeiro`)
    REFERENCES `hospital_senac_humberto`.`enfermeiro` (`idenfermeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
