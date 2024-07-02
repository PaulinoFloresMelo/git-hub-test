/*  
 --Description: diseño de la base de datos del Sistema de Módulos Municipal
 -- Author:  Adriana Melo Linares 
 -- Date:  19/06/2024 
 -- Technology: SQL
 -- version: V.0.1.0 pre-alpha 
 */

CREATE DATABASE IF NOT EXISTS db_smm CHARACTER SET utf8 COLLATE utf8_general_ci;
USE db_smm;

CREATE TABLE IF NOT EXISTS tbl_address(	        -- Tabla 'dirección' (domicilio fiscal)     
addr_id INT NOT NULL AUTO_INCREMENT,             -- id
zip_code VARCHAR(32) NOT NULL,                  -- código postal     - ver 'CatCFDI_V_20240619.xlsx' pestaña 'c_CodigoPostal_Parte_1' y 'c_CodigoPostal_Parte_2'
name_roadway VARCHAR(150),                      -- tipo de vialidad
ins_number VARCHAR(10) NOT NULL,                -- número interior 'inside_number'
locality VARCHAR(10) NOT NULL,                  -- localidad
federal_entity VARCHAR(70) NOT NULL,            -- entidad federativa o estado
type_road VARCHAR(100) NOT NULL,                -- tipo de vialidad
out_number VARCHAR(10) NOT NULL,                -- número exterior 'outside_number'
neighborhood VARCHAR(100) NOT NULL,             -- nombre de colonia, barrio o vecindario
municipality VARCHAR(100) NOT NULL,             -- nombre del municipio o demarcación territorial
ref_btw_st VARCHAR(100) NOT NULL,               -- referencia entre calle - 'reference_between_street'
ref_and_st VARCHAR(100) NOT NULL,               -- referencia y calle - 'reference_and_street'
PRIMARY KEY (addr_id)	
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS tbl_organization(	                     -- tabla 'organización'
org_id INT NOT NULL AUTO_INCREMENT,                                  -- id
rfc VARCHAR(12) NOT NULL,                                            -- rfc (Registro Federal de Contribuyentes), sólo personas morales    
company_name VARCHAR(254) NOT NULL,                                  -- denominación / Razón social    
capital_regime VARCHAR(250) NOT NULL,                                -- régimen Capital                                       
trade_name VARCHAR(250) NOT NULL,			                         -- nombre Comercial
start_operations DATE NOT NULL,                                      -- fecha inicio de operaciones
status_sat BOOLEAN NOT NULL,                                         -- estatus es el padrón SAT
path_csf  VARCHAR(255) NOT NULL,                                     -- ruta ubicación .pdf constancia de situación fiscal
ase_key VARCHAR(10),                                                 -- sí es municipio - clave Auditoria Superior del Estado
asf_key VARCHAR(10),                                                 -- sí es municipio - clave Auditoria Superior de la Federanción
admin_period VARCHAR(15),                                            -- sí es municipio - periodo de administración '2021-2024'
last_change_status_sat_date DATE NOT NULL,                           -- fecha de último cambio de estado padrón SAT
registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,       -- fecha de registro (creación) en el sistema
cancellation_date DATETIME,                                          -- fecha de baja en el sistema
last_updated_date DATETIME NOT NULL,                                 -- fecha de creación
PRIMARY KEY (org_id)	
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS employee(                             -- tabla 'empleado', pueden represntar Servidores Públicos o Tandeanos
empl_id INT NOT NULL AUTO_INCREMENT,                             -- id
rfc VARCHAR(13) NOT NULL,                                        -- rfc (Registro Federal de Contribuyentes), sólo personas fisicas
curp VARCHAR(18) NOT NULL,                                       -- curp (Clave Única de Registro de Población)
first_name VARCHAR(255) NOT NULL,                                -- nombre/nombres de pila
middle_name VARCHAR(255) NOT NULL,                               -- primer apellido
last_name VARCHAR(255) NOT NULL,                                 -- segundo apellido
trade_name VARCHAR(250) NOT NULL,			                     -- nombre Comercial
start_operations DATE NOT NULL,                                  -- fecha inicio de operaciones
status_sat BOOLEAN NOT NULL,                                     -- estatus es el padrón SAT
last_change_status_sat_date DATE NOT NULL,                       -- fecha de último cambio de estado padrón SAT
registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,   -- fecha de registro (creación) en el sistema
cancellation_date DATETIME,                                      -- fecha de baja en el sistema
last_updated_date DATETIME NOT NULL,                             -- fecha de creación
PRIMARY KEY (empl_id),
fk_addr_id FOREIGN KEY(addr_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
fk_org_id FOREIGN KEY(org_id)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE = INNODB;
