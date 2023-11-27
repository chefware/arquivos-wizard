CREATE DATABASE chefware;

USE chefware;

CREATE TABLE Empresa (
  idEmpresa INT AUTO_INCREMENT,
  nome VARCHAR(45),
  cnpj CHAR(14),
  telefone VARCHAR(11),
  PRIMARY KEY (idEmpresa)
);

INSERT INTO Empresa (nome, cnpj, telefone) VALUES
('ChefWare', '24583958023502', '11945293503');

CREATE TABLE Maquina (
  idMaquina INT AUTO_INCREMENT,
  numSerie VARCHAR(45),
  nome VARCHAR(45),
  hostname VARCHAR(100),
  modelo VARCHAR(45),
  local VARCHAR(45),
  descComponentes VARCHAR(100),
  fkEmpresa INT,
  ativo BIT,
  PRIMARY KEY (idMaquina),
  FOREIGN KEY (fkEmpresa)
    REFERENCES Empresa (idEmpresa)
);


INSERT INTO Maquina VALUES (null, '0123546','Maquina Teste','DESKTOP-667P21J','Modelo','local','componente',1,1);


CREATE TABLE Funcionario (
  idFuncionario INT AUTO_INCREMENT,
  nome VARCHAR(45),
  email VARCHAR(45),
  senha VARCHAR(45),
  cpf CHAR(11),
  cargo VARCHAR(45),
  privilegio VARCHAR(45),
  foto VARBINARY(1000),
  fkEmpresa INT,
  PRIMARY KEY (idFuncionario),
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)

);

CREATE TABLE Endereco (
  idEndereco INT AUTO_INCREMENT,
  logradouro VARCHAR(45),
  cep CHAR(8),
  bairro VARCHAR(45),
  numero VARCHAR(45),
  estado VARCHAR(45),
  fkEmpresa INT,
  PRIMARY KEY (idEndereco),
  FOREIGN KEY (fkEmpresa)
    REFERENCES Empresa (idEmpresa)
);

CREATE TABLE Componente (
  idComponente INT AUTO_INCREMENT,
  marca VARCHAR(45),
  compatibilidade VARCHAR(45),
  dataVencimento VARCHAR(45),
  tipo VARCHAR(100),
  fkMaquina INT,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
  PRIMARY KEY (idComponente, fkMaquina)
);
INSERT INTO Componente VALUES
(null, 'Kingston', 'Windows/Linux', '2002-09-02','Memória', 1),
(null, 'XrayDisk', 'Windows/Linux', '2030-09-02','Disco',  1),
(null, 'RealtekRK', 'Windows/Linux', '2030-09-02','Rede', 1),
(null, 'Intel', 'Windows/Linux', '2030-09-02','CPU', 1);


CREATE TABLE Dados (
  idDados INT AUTO_INCREMENT,
  descricao VARCHAR(100),
  valor VARCHAR(100),
  unidadeMedida VARCHAR(100),
  fkComponente INT,
  fkMaquina INT,
  dataHora DATETIME,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
  FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
  PRIMARY KEY (idDados)
);

CREATE TABLE Historico (
  idHistorico INT AUTO_INCREMENT PRIMARY KEY,
  fkMaquina INT,
  fkComponente INT,
  dataHora DATETIME,
  nome VARCHAR(45),
  leitura VARCHAR(45),
  unidadeMedida VARCHAR(45),
  FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
  FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente)
);
