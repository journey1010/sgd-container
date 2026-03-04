Implementación SGD v4.7

https://www.gob.pe/62915-el-sistema-de-gestion-documental-sgd
SQL SERVER 2022: https://www.microsoft.com/es-es/sql-server/sql-server-downloads
https://dbeaver.io/download/
https://mobaxterm.mobatek.net/download-home-edition.html

Contraseña del Admin por defecto y demas usuarios del SGD:
Usuario: ADMIN y Contraseña: Demo2018

Convertir imagen a base64 o a la inversa:
https://base64.guru/converter/decode/image

C:\Program Files\PostgreSQL\16\data
host    IDOSGD_PCM     IDOSGD          192.168.0.22/32         scram-sha-256

Descargar JDK:
• Windows: https://www.oracle.com/pe/java/technologies/downloads/
• Linux: https://adoptium.net/es/temurin/releases/

Variables de entorno Windows:
JAVA_HOME
C:\Program Files\Java\jdk-1.8
%JAVA_HOME%\bin

Payara: https://repo1.maven.org/maven2/fish/payara/distributions/payara/5.2022.5/
PostgreSQL: https://www.enterprisedb.com/downloads/postgres-postgresql-downloads
Linux: https://www.postgresql.org/download/linux/ubuntu/

##INSTALACIÓN DEL SERVIDOR DE APLICACIONES##
Fonts o fuentes:
Ubuntu: sudo apt install ttf-mscorefonts-installer
Centos: msttcorefonts2.0-1.noarch.rpm

cd /opt/payara5/bin/
./asadmin start-domain domain1
./asadmin change-admin-password
./asadmin enable-secure-admin
./asadmin restart-domain domain1
./asadmin login
./asadmin stop-domain domain1

https://localhost:4848/ o https://IP_DE_TU_SERVIDOR_DE_APLICAIONES:4848/

Descargar JDBC (Se descargar de acuerdo a  la Base de Datos):
SQL Server: https://learn.microsoft.com/es-es/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver16
PostgreSQL: https://jdbc.postgresql.org/download/

Ruta para copiar el JDBC:
Windows: C:\payara5\glassfish\domains\domain1\lib\ext
Linux: payara5\glassfish\domains\domain1\lib\ext

Crear ruta de la imágen de login:
Windows - C:\payara5\glassfish\domains\domain1\docroot\recursos\images
Linux - payara5\glassfish\domains\domain1\docroot\recursos\images

Crear la carpeta tmp y tmppcm en la siguiente ruta:
Windows:
C:\tmp
C:\tmppcm
Linux:
\tmp
\tmppcm
\glassfish\tmp
\glassfish\tmppcm

##Ingresar al Payara desde la web##
#Eliminar en JVM Settings
-XX:+UnlockDiagnosticVMOptions
-XX:NewRatio=2

#Agregar 
-Xmx6144m  #-Xmx (tamaño máximo de almacenamiento dinámico Java)
-Xms6144m  #-Xms (tamaño mínimo de almacenamiento dinámico Java)

C:\server\payara5\glassfish\domains\domain1\config\domain.xml

JDBC Connection Pools:
Pool Name   : IdoTradoc_webDesaPool
Resouce Type: javax.sql.ConnectionPoolDataSource
Seleccionamos: Postgresql o Oracle o MicrosoftSqlServer

JDBC Connection Pools --> Aditional 
Oracle:
- URL: oracle:thin:@IP_DE_TU_SERVIDOR_DE_DB:1521:XE
- User: usuario_de_tu_DB
- Password: contraseña_de_tu_DB
- ServerName: IP_DE_TU_SERVIDOR_DE_DB

#PostgreSQL:
- URL: jdbc:postgresql://IP_DE_TU_SERVIDOR_DE_DB:5432/NOMBRE_DE_TU_DB
- Url: jdbc:postgresql://IP_DE_TU_SERVIDOR_DE_DB:5432/NOMBRE_DE_TU_DB
- User: usuario_de_tu_DB
- Password: contraseña_de_tu_DB
- ServerName: IP_DE_TU_SERVIDOR_DE_DB

#SQL Server:
- URL: jdbc:sqlserver://IP_DE_TU_SERVIDOR_DE_DB:1433;databaseName=NOMBRE_DE_TU_DB;integratedSecurity=false;encrypt=false;trustServerCertificate=false
- Url: jdbc:sqlserver://IP_DE_TU_SERVIDOR_DE_DB:1433;databaseName=NOMBRE_DE_TU_DB;integratedSecurity=false;encrypt=false;trustServerCertificate=false
- User: usuario_de_tu_DB
- Password: contraseña_de_tu_DB
- ServerName: IP_DE_TU_SERVIDOR_DE_DB

JDBC Resources:
#POSTGRESQL
jdbc/idotradocDS_PostgreSql
jdbc/tdSecurityDS_PostgreSql
jdbc/sgdconsultaDS_PostgreSql
jdbc/consulta_sgd_postgresql
jdbc/mpv_sgd_SQL
jdbc/verifica_sgd_postgresql
jdbc/sgdtareaDS_PostgreSql

#SQL SERVER
jdbc/idotradoc_webSqlDS
jdbc/tdSecurity_SqlDS
jdbc/sgdconsulta_webSqlDS
jdbc/consulta_sgd_SQL
jdbc/mpv_sgd_SQL_SERVER
jdbc/verifica_sgd_SQL
jdbc/sgdtareaDS_SqlServer

#ORACLE
jndi.main.jndiName=jdbc/idotradoc_webDS_oracle
jndi.sec.jndiName=jdbc/tdSecurityDS_oracle
jndi.qry.jndiName=jdbc/sgdconsulta_webDS_oracle

Copiar las carpetas: sgdproperties, consultaproperties, mpvproperties y verificaproperties en la siguiente ruta:
Windows: C:\payara5\glassfish\domains\domain1\
Linux:\payara5\glassfish\domains\domain1\

Aplicaciones Internas (SGD + MPV):
- sgd = Sistema de Gestión Documental = https://IP_SERVIDOR:8181/sgd/login.do
- mpv = Mesa de Partes Virtual = https://IP_SERVIDOR:8181/mpv/login.jsf
- notificador = Notifica los registros de las MPD
- wsiotramite.war = https://TU_IP_DE_SERVIDOR_DE_APP_O_SUB_DOMINIO:8181/wsiotramite/Tramite?wsdl
- wstradoc.war

Aplicaciones Externas:
- mpd = Mesa de Partes Digital = https://IP_SERVIDOR:8181/mpd/inicio.do
- consulta = Consultar Documentos = https://IP_SERVIDOR:8181/consulta/inicio.do
- verifica = Verificador y/o Validado = https://IP_SERVIDOR:8181/verifica/inicio.do

CARGAR SLIDER:
SELECT * FROM IDOSGD.SI_ELEMENTO
declare @imagen varbinary(max)
set @imagen = (SELECT * FROM OPENROWSET(BULK 'C:\banner\banner3.jpg', SINGLE_BLOB) AS Imagen)
UPDATE [IDOSGD].[SI_ELEMENTO] set BL_DOC = @imagen WHERE CELE_DESELE = 'BANNER 3'
En el disco C o raiz del servidor de DB crear una carpeta banner y poner los banner.

CARGAR PLANTILLAS:
PostgreSQL
SELECT * FROM IDOSGD.TDTR_PLANTILLA_DOCX;
UPDATE IDOSGD.TDTR_PLANTILLA_DOCX SET bl_doc = pg_read_binary_file('/plantillas/INFORME.DOCX')
WHERE co_tipo_doc = '003';

SQL Server
SELECT * FROM IDOSGD.TDTR_PLANTILLA_DOCX;
UPDATE IDOSGD.TDTR_PLANTILLA_DOCX SET bl_doc = (SELECT * FROM OPENROWSET (BULK 'C:\plantillas\INFORME.DOCX', SINGLE_BLOB) AS X) 
where co_tipo_doc = '003';
En el disco C o raiz del servidor de DB crear una carpeta y poner las plantillas. Reemplazar en la ruta y co_tipo_doc.

Quitar captcha SGD: Segmento del cliente no del servidor
SELECT ctab_codtab, cele_codele, cele_desele, nele_numsec, cele_descor, cele_codele2, cele_codele3, bl_doc
FROM IDOSGD.SI_ELEMENTO
WHERE ctab_codtab='SEG_RED_ENTIDAD';
Agrega la red donde esta ubicados las pcs de los usuarios.
INSERT INTO IDOSGD.SI_ELEMENTO (ctab_codtab, cele_codele, cele_desele, nele_numsec, cele_descor, cele_codele2, cele_codele3, bl_doc) values ('SEG_RED_ENTIDAD','7','OTIRED',null,'192.168.0',null,null,null);

Poner a titular
SELECT * FROM IDOSGD.RHTM_DEPENDENCIA
UPDATE IDOSGD.RHTM_DEPENDENCIA
SET CO_TIPO_ENCARGATURA = 1;

Desplegar los tipos de documentos para VERIFICA
SELECT * FROM IDOSGD.SI_MAE_TIPO_DOC
UPDATE IDOSGD.SI_MAE_TIPO_DOC
SET IN_DOC_SALIDA = 1;
SELECT * FROM IDOSGD.SI_MAE_TIPO_DOC
UPDATE IDOSGD.SI_MAE_TIPO_DOC
IN_MULTIPLE = 1;

SELECT * FROM idosgd.si_mae_tipo_doc
SELECT * FROM idosgd.iotdtx_tipo_documento
update idosgd.iotdtx_tipo_documento set CDOC_TIPDOC='019' where CIDTIPDOC='02'

SELECT * FROM IDOSGD.TDTR_PARAMETROS
URLAPLICATION = mpv
WSSERVICELOCATION = wss://ip_servidor_aplicación_o_sub_dominio:8181/wstradoc/chat/
URL_WEB_DESC_ANEXO = (Poner enlace de verifica)
URL_WEB_VERIFICA = (Poner enlace de verifica)
URL_RENIEC_SOAP = https://ws2.pide.gob.pe/services/RENIECCDni?wsdl
URL_RENIEC_REST = https://ws2.pide.gob.pe/Rest/RENIEC/Consultar?

WSIOTRAMITE
wsiotramite\WEB-INF\classes\messageResource.properties
1 NOMBRE_ENTIDAD = PRESIDENCIA DEL CONSEJO DE MINISTROS

MPV
Cambiar Logo: mpv\util\images\logo
login.xhtml: mpv (75 y 76)
templates\pie.xhtml: mpv\templates (12 y 15)
\pages\error.xhtml (72 y 73)
\pages\sesionExpirada.xhtml (68 y 69)

\WEB-INF\classes\pe\gob\segdi\iotramitesgd\messageresource\Parametros.properties
1 P_RUC_ENTIDAD_EMISORA = RUC_DE_LA_ENTIDADAD_EMISORA
3 P_NOMBRE_ENTIDAD_EMISORA = NOMBRE_DE_LA_ENTIDAD_EMISORA

Verificar que hay consumo:
https://www.soapui.org/downloads/soapui/
https://TU_IP_DE_SERVIDOR_DE_APP_O_SUB_DOMINIO:8181/wsiotramite/Tramite?wsdl
Ejm.: https://sgd.pcm.gob.pe/wsiotramite/Tramite?wsdl

https://ws1.pide.gob.pe/services/PcmEntidadPrueba?wsdl
https://ws2.pide.gob.pe/services/PcmIMgdEntidad?wsdl
https://ws2.pide.gob.pe/services/PcmIMgdTramite?wsdl

Windows: https://ws3.pide.gob.pe/Rest/Sunat/DatosPrincipales?numruc=20168999926 (En un navegador desde el servidor la tabla TDTR_PARAMETROS = P)
Linux: curl -L https://ws3.pide.gob.pe/Rest/Sunat/DatosPrincipales?numruc=20168999926 (En una terminal, la tabla TDTR_PARAMETROS = P)
Linux: curl -L "https://ws1.pide.gob.pe/Rest/Pide/IP" (Conocer la ip con la cual consultan a la PIDE)

PRUEBAS:
En el SGD = P
Enviar desde tu aplicacion de mpv a pcm = D

https://ws2.pide.gob.pe/Rest/RENIEC/Consultar?nuDniConsulta=00010533&nuDniUsuario=45013195&nuRucUsuario=20222295166&password=45013195
https://ws2.pide.gob.pe/Rest/RENIEC/Consultar?nuDniConsulta=DNI_A_CONSULTARC&nuDniUsuario=DNI_USUARIO_RENIEC&nuRucUsuario=RUC_DE_LAENTIDAD&password=CONTRASEÑA_RENIEC

Abrir puertos:
4848, 1433, 8080, 8181, 443

#CONFIGURACION DE SERVIDOR DE CORREOS
USER_NAME=sgd@munimaynas.gob.pe
#USER_PASSWORD=2WKWvraI$0o-
USER_PASSWORD=BD83A14C16D42CF8B0F4775EA33C6FC1
SERVER_IP=mail.munimaynas.gob.pe
SERVER_PORT=25
#SERVER_PORT=465
EMAIL_FROM=sgd@munimaynas.gob.pe
SMTP_AUTH=false
SMTP_STARTTLS=true

Cliente: 
https://sgd.unmsm.edu.pe/software.html

Solicitar Servicio de la PIDE de consulta DNI y RUC (A1)
https://www.gob.pe/742-plataforma-nacional-de-interoperabilidad-utilizar-servicios-de-la-plataforma

https://erep.reniec.gob.pe/pier/login.jsf
https://portaladminusuarios.reniec.gob.pe/AdminUsuariosConvenios2/

Video de carga inicial
https://www.youtube.com/watch?v=MoC2u_Vk998

La IP utilizada por la Mesa de Partes Virtual (MPV) para consumir los Webservices de nuestro nodos que tienen que agregarlo a su firewal:
161.132.150.194 a 38.43.152.194
161.132.150.2 a 38.43.152.66

NOMBRE_ENTIDAD - Región (On-Premise) SGD + MPV + MPD + CON + VER + PIDE

Servidores:
* S.O de BD: Linux Ubuntu Server 22.04
* Motor de BD: PostgreSQL 16.4
* S.O de Serv. Aplic.: Linux Ubuntu Server 22.04
* Serv. Aplicación: Payara Server versión 5.2022.5

https://ws2.pide.gob.pe/services/PcmIMgdEntidad?wsdl
https://ws2.pide.gob.pe/services/PcmCuo?wsdl
https://ws3.pide.gob.pe/services/PcmIMgdTramite?wsdl
