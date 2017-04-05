-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: gym_tecpro
-- ------------------------------------------------------
-- Server version 5.7.17
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS,ANSI' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "alimentos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "alimentos" (
  "nombre" varchar(50) NOT NULL,
  "pc" float DEFAULT '0',
  "agua" float DEFAULT '0',
  "prot" float DEFAULT '0',
  "hc" float DEFAULT '0',
  "grasa" float DEFAULT '0',
  "satur" float DEFAULT '0',
  "mono" float DEFAULT '0',
  "poli" float DEFAULT '0',
  "colesterol" float DEFAULT '0',
  "fibra" float DEFAULT '0',
  "sodio" float DEFAULT '0',
  "potasio" float DEFAULT '0',
  "magnesio" float DEFAULT '0',
  "calcio" float DEFAULT '0',
  "fosforo" float DEFAULT '0',
  "hierro" float DEFAULT '0',
  "indiceglucemico" float DEFAULT '0',
  "id" int(11) NOT NULL auto_increment,
  PRIMARY KEY ("id","nombre")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "alimentos"
--

--
-- Table structure for table "socios"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "socios" (
  "ID_DATOS_PERS" int(11) NOT NULL auto_increment,
  "NOMBRE" varchar(50) DEFAULT NULL,
  "APELLIDO" varchar(50) DEFAULT NULL,
  "DNI" varchar(20) DEFAULT NULL,
  "FECHA_NAC" varchar(10) DEFAULT NULL,
  "FECHA_ING" date DEFAULT NULL,
  "DIR" varchar(200) DEFAULT NULL,
  "TEL" varchar(50) DEFAULT NULL,
  "SEXO" char(1) DEFAULT NULL,
  "FECHA_ULT_PAGO" date DEFAULT NULL,
  "ACTIV" bigint(20) DEFAULT NULL,
  "FECHA_PROX_PAGO" date DEFAULT NULL,
  "ACTIVO" int(2) DEFAULT NULL,
  "CUENTA_CORRIENTE" float DEFAULT '0',
  "FACEBOOK" varchar(100) DEFAULT NULL,
  "NOSCONOCIOPOR" varchar(30) DEFAULT NULL,
  "CELULAR" varchar(50) DEFAULT NULL,
  "MAIL" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("ID_DATOS_PERS")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "socios"
--

--
-- Table structure for table "alimentos_dietas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "alimentos_dietas" (
  "id" int(11) NOT NULL auto_increment,
  "alimento_id" int(11) NOT NULL,
  "dieta_id" int(11) NOT NULL,
  "porcion" float DEFAULT NULL,
  "hora" varchar(45) DEFAULT NULL,
  "dia" varchar(45) DEFAULT NULL,
  "numero_dia" int(11) DEFAULT NULL,
  PRIMARY KEY ("id","dieta_id","alimento_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "alimentos_dietas"
--


--
-- Table structure for table "arancels"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "arancels" (
  "id" int(11) NOT NULL auto_increment,
  "nombre" varchar(80) DEFAULT NULL,
  "precio" float DEFAULT NULL,
  "fecha" date DEFAULT NULL,
  "activo" int(5) DEFAULT NULL,
  "categoria" varchar(15) DEFAULT NULL,
  "dias" int(2) DEFAULT '0',
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "arancels"
--


--
-- Table structure for table "articulos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "articulos" (
  "id" int(11) NOT NULL auto_increment,
  "codigo" varchar(10) DEFAULT NULL,
  "articulo" varchar(20) DEFAULT NULL,
  "precio" float DEFAULT NULL,
  "precio_compra" float DEFAULT NULL,
  "stock" int(11) DEFAULT NULL,
  "descripcion" varchar(120) DEFAULT NULL,
  "proveedor_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "articulos"
--


--
-- Table structure for table "articulos_compras"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "articulos_compras" (
  "id" int(11) NOT NULL auto_increment,
  "compra_id" int(11) DEFAULT NULL,
  "articulo_id" int(11) DEFAULT NULL,
  "cantidad" float NOT NULL,
  "precio_final" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "articulos_compras"
--


--
-- Table structure for table "articulos_ventas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "articulos_ventas" (
  "id" int(11) NOT NULL auto_increment,
  "venta_id" int(11) DEFAULT NULL,
  "articulo_id" int(11) DEFAULT NULL,
  "cantidad" int(11) NOT NULL,
  "precio_final" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "articulos_ventas"
--


--
-- Table structure for table "asistencias"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "asistencias" (
  "ID_ASISTENCIA" int(11) NOT NULL auto_increment,
  "ID_DATOS_PERS" int(11) NOT NULL,
  "FECHA" date DEFAULT NULL,
  "ID_ACTIV" int(11) DEFAULT NULL,
  "ID_ACTIV_COMBO" int(11) DEFAULT NULL,
  PRIMARY KEY ("ID_ASISTENCIA"),
  FOREIGN KEY ("ID_DATOS_PERS") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "asistencias"
--


--
-- Table structure for table "categorias"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "categorias" (
  "id" int(11) NOT NULL auto_increment,
  "nombre" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "categorias"
--


--
-- Table structure for table "combos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "combos" (
  "id_combo" int(11) NOT NULL,
  "id_activ" int(11) NOT NULL,
  "dias" int(11) DEFAULT NULL,
  PRIMARY KEY ("id_combo","id_activ"),
  FOREIGN KEY ("id_activ") REFERENCES "arancels" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY ("id_combo") REFERENCES "arancels" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "combos"
--


--
-- Table structure for table "compras"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "compras" (
  "id" int(11) NOT NULL auto_increment,
  "monto" float DEFAULT NULL,
  "proveedor_id" int(11) DEFAULT NULL,
  "fecha" date NOT NULL,
  "pago" int(11) DEFAULT '0',
  "fecha_pago" date DEFAULT NULL,
  "descuento" float DEFAULT '0',
  "pago_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "compras"
--


--
-- Table structure for table "datos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "datos" (
  "id" int(11) NOT NULL auto_increment,
  "descripcion" varchar(200) DEFAULT NULL,
  "categoria_id" int(11) DEFAULT NULL,
  "ingreso_egreso" varchar(7) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "datos"
--


--
-- Table structure for table "demos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "demos" (
  "id" int(11) NOT NULL auto_increment,
  "fecha" date DEFAULT NULL,
  "dias" int(11) DEFAULT '7',
  "activado" int(1) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "demos"
--


--
-- Table structure for table "dias"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "dias" (
  "id" int(11) NOT NULL auto_increment,
  "rutina_id" int(10) DEFAULT NULL,
  "dia" varchar(15) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "dias"
--


--
-- Table structure for table "dias_ejercicios"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "dias_ejercicios" (
  "id" int(11) NOT NULL auto_increment,
  "dia_id" int(10) DEFAULT NULL,
  "ejercicio_id" int(10) DEFAULT NULL,
  "series" int(10) DEFAULT '0',
  "repeticiones" int(10) DEFAULT '0',
  "tiempo" varchar(100) DEFAULT '0',
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "dias_ejercicios"
--


--
-- Table structure for table "dietas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "dietas" (
  "id" int(11) NOT NULL auto_increment,
  "nombre" varchar(45) NOT NULL,
  "descripcion" varchar(300) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "dietas"
--


--
-- Table structure for table "ejercicios"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "ejercicios" (
  "id" int(11) NOT NULL auto_increment,
  "ejercicio" varchar(120) DEFAULT NULL,
  "grupo" varchar(20) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "ejercicios"
--


--
-- Table structure for table "emails"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "emails" (
  "email" varchar(45) NOT NULL,
  "password" varchar(45) DEFAULT NULL,
  "id" int(11) NOT NULL auto_increment,
  PRIMARY KEY ("id","email")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "emails"
--


--
-- Table structure for table "envios"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "envios" (
  "fecha" date NOT NULL,
  "enviado" int(11) DEFAULT NULL,
  "id" int(11) NOT NULL auto_increment,
  PRIMARY KEY ("id","fecha")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "envios"
--


--
-- Table structure for table "fichas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "fichas" (
  "ID_FICHA_MEDICA" int(11) NOT NULL auto_increment,
  "ID_DATOS_PERS" int(11) NOT NULL,
  "TEL_EMERG" varchar(20) DEFAULT NULL,
  "GRUPO_SANG" varchar(2) DEFAULT NULL,
  "FACTOR" varchar(3) DEFAULT NULL,
  "ALERGICO" varchar(30) DEFAULT NULL,
  "MEDICAM" varchar(30) DEFAULT NULL,
  "OBSERV" varchar(3000) DEFAULT NULL,
  "ARTROSIS" int(2) DEFAULT NULL,
  "ASMA" int(2) DEFAULT NULL,
  "CARDIACO" int(2) DEFAULT NULL,
  "DIABETES" int(2) DEFAULT NULL,
  "EMBARAZO" int(2) DEFAULT NULL,
  "ENDOCRINOLOGIA" int(2) DEFAULT NULL,
  "HUESOS" int(2) DEFAULT NULL,
  "PULMONARES" int(2) DEFAULT NULL,
  "EPILEPTICO" int(2) DEFAULT NULL,
  "HIPERTENSION" int(2) DEFAULT NULL,
  "DEPORTIVA" int(2) DEFAULT NULL,
  "OBESIDAD" int(2) DEFAULT NULL,
  "REUMA" int(2) DEFAULT NULL,
  PRIMARY KEY ("ID_FICHA_MEDICA"),
  FOREIGN KEY ("ID_DATOS_PERS") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "fichas"
--


--
-- Table structure for table "gastos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "gastos" (
  "id" int(11) NOT NULL auto_increment,
  "dato_id" int(11) DEFAULT NULL,
  "monto" float DEFAULT NULL,
  "fecha" date DEFAULT NULL,
  "descrip" varchar(200) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "gastos"
--


--
-- Table structure for table "huellas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "huellas" (
  "id" int(11) NOT NULL auto_increment,
  "huella" blob,
  "dedo" varchar(45) DEFAULT NULL,
  "client_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("client_id") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "huellas"
--


--
-- Table structure for table "pagoproveedors"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "pagoproveedors" (
  "id" int(11) NOT NULL auto_increment,
  "fecha" date DEFAULT NULL,
  "monto" float DEFAULT NULL,
  "proveedor_id" int(11) DEFAULT NULL,
  "descripcion" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "pagoproveedors"
--


--
-- Table structure for table "pagos"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "pagos" (
  "ID_PAGOS" int(11) NOT NULL auto_increment,
  "ID_DATOS_PERS" int(11) NOT NULL,
  "FECHA" date DEFAULT NULL,
  "MONTO" float DEFAULT NULL,
  "MODO" varchar(100) DEFAULT NULL,
  "DESCRIPCION" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("ID_PAGOS"),
  UNIQUE KEY "ID_PAGOS_UNIQUE" ("ID_PAGOS"),
  FOREIGN KEY ("ID_DATOS_PERS") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "pagos"
--


--
-- Table structure for table "profes"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "profes" (
  "ID_PROFES" int(11) NOT NULL auto_increment,
  "NOMBRE" varchar(20) DEFAULT NULL,
  "APELLIDO" varchar(20) DEFAULT NULL,
  "DNI" varchar(12) DEFAULT NULL,
  "FECHA_NAC" date DEFAULT NULL,
  "DIR" varchar(30) DEFAULT NULL,
  "TEL" varchar(20) DEFAULT NULL,
  "SEXO" char(1) DEFAULT NULL,
  "OBSERV" varchar(3000) DEFAULT NULL,
  PRIMARY KEY ("ID_PROFES")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "profes"
--


--
-- Table structure for table "clase"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "clase" (
  "ID_CLASE" int(11) NOT NULL auto_increment,
  "ID_PROFES" int(11) NOT NULL,
  "FECHA" date DEFAULT NULL,
  "ACTIV" bigint(20) DEFAULT NULL,
  PRIMARY KEY ("ID_CLASE"),
  FOREIGN KEY ("ID_PROFES") REFERENCES "profes" ("ID_PROFES") ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "clase"
--


--
-- Table structure for table "proveedors"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "proveedors" (
  "id" int(11) NOT NULL auto_increment,
  "nombre" varchar(100) NOT NULL,
  "cuit" varchar(45) DEFAULT NULL,
  "direccion" varchar(100) DEFAULT NULL,
  "telefono" varchar(45) DEFAULT NULL,
  "celular" varchar(45) DEFAULT NULL,
  "email" varchar(45) DEFAULT NULL,
  "cuenta_corriente" float DEFAULT '0',
  "forma_de_pago" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "proveedors"
--


--
-- Table structure for table "pventas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "pventas" (
  "id" int(11) NOT NULL auto_increment,
  "ID_DATOS_PERS" int(11) NOT NULL,
  "fecha" date DEFAULT NULL,
  "monto" float DEFAULT NULL,
  "modo" varchar(100) DEFAULT NULL,
  "gasto_id" int(10) DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "id_UNIQUE" ("id"),
  FOREIGN KEY ("ID_DATOS_PERS") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "pventas"
--


--
-- Table structure for table "rutinas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "rutinas" (
  "id" int(11) NOT NULL auto_increment,
  "socio_id" int(10) DEFAULT NULL,
  "descrip" varchar(200) DEFAULT NULL,
  "fecha_inicio" date DEFAULT NULL,
  "fecha_fin" date DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "rutinas"
--


--
-- Table structure for table "socioarancels"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "socioarancels" (
  "id" int(11) NOT NULL auto_increment,
  "id_socio" int(11) DEFAULT NULL,
  "id_arancel" int(11) DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("id_arancel") REFERENCES "arancels" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY ("id_socio") REFERENCES "socios" ("ID_DATOS_PERS") ON DELETE CASCADE ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "socioarancels"
--


--
-- Table structure for table "socios_dietas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "socios_dietas" (
  "id" int(11) NOT NULL auto_increment,
  "socio_id" varchar(45) NOT NULL,
  "dieta_id" varchar(45) NOT NULL,
  "desde" date DEFAULT NULL,
  "hasta" date DEFAULT NULL,
  PRIMARY KEY ("id","socio_id","dieta_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "socios_dietas"
--


--
-- Table structure for table "users"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "users" (
  "id" int(11) NOT NULL auto_increment,
  "USUARIO" varchar(20) DEFAULT NULL,
  "PASSWD" varchar(20) DEFAULT NULL,
  "ADMINIS" int(2) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "users"
--


--
-- Table structure for table "ventas"
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "ventas" (
  "id" int(11) NOT NULL auto_increment,
  "monto" float DEFAULT NULL,
  "socio_id" int(11) DEFAULT NULL,
  "fecha" date NOT NULL,
  "forma_pago" varchar(20) DEFAULT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "ventas"
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-01 15:18:54
