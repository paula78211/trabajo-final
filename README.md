# Sistema de Gestión de Compras, Devoluciones y Opiniones con Geolocalización

Paula Rubio 
Michelle Michelle
https://drive.google.com/file/d/1dUmFXqXJ6MwvB0dBzOAocj_aZUJys7gR/view?usp=drive_link

Este proyecto implementa un sistema integral que permite gestionar compras, devoluciones y opiniones de los clientes, incluyendo funcionalidades de geolocalización para encontrar sucursales cercanas y almacenamiento de comentarios en bases de datos no relacionales.


## **Características del Sistema**
- **Frontend**: Angular con servicios para consumo de API REST.
- **Backend**: Node.js con Express y conexión a bases de datos MySQL y MongoDB.
- **Bases de Datos**:
  - **MySQL** para datos estructurados (clientes, compras, sucursales, etc.).
  - **MongoDB** para comentarios y calificaciones.
- **Geolocalización**: Consultas espaciales para encontrar sucursales más cercanas.
- **API REST**: Gestión de datos mediante endpoints.

---

## **Requisitos Previos**
PHYTHON
aNGULAR 
Mysql
Mongo

---

# *Instrucciones para Descargar, Clonar y Ejecutar el Proyecto*

### 1. *Descargar el Proyecto (Archivo ZIP)*
Si no deseas clonar el repositorio usando Git, puedes descargar el proyecto como un archivo ZIP desde GitHub:

1. Ve al repositorio en GitHub:  
   [https://github.com/usuario/proyecto](https://github.com/usuario/proyecto)
2. Haz clic en *"Code"* > *"Download ZIP"*.
3. Extrae el contenido del archivo ZIP en tu computadora.

---

### 2. *Clonar el Proyecto con Git*
Si prefieres clonar el proyecto desde GitHub, ejecuta el siguiente comando en tu terminal:

bash
git clone https://github.com/usuario/proyecto.git


---

### 3. *Configuración del Backend*
1. Accede a la carpeta del backend:

bash
cd proyecto/backend


2. Instala las dependencias:

- Para *Flask* (Python):

bash
pip install -r requirements.txt


- Para *Node.js* (Express):

bash
npm install


3. Configura las credenciales de *MySQL* y *MongoDB* en los archivos de configuración (ejemplo: config.py o .env).

4. Inicia el servidor del backend:

- Para Flask:

bash
python app.py


- Para Node.js:

bash
npm start


---

### 4. *Configuración del Frontend*
1. Accede a la carpeta del frontend:

bash
cd ../frontend


2. Instala las dependencias necesarias:

bash
npm install


3. Inicia el servidor del frontend:

bash
npm start


El frontend estará disponible en http://localhost:3000.

---

### 5. *Configuración de las Bases de Datos*
- *MySQL*:
  - Importa el archivo SQL (database.sql) proporcionado en tu servidor MySQL.
  - Puedes usar herramientas como *phpMyAdmin* o ejecutar el siguiente comando:

bash
mysql -u usuario -p nombre_base_datos < database.sql


- *MongoDB*:
  - Asegúrate de que MongoDB esté en ejecución.
  - Si es necesario, importa los datos iniciales en MongoDB usando Compass o MongoShell.

---

### 6. *Ejecución del Proyecto Completo*
1. Asegúrate de que tanto el *backend* como el *frontend* estén corriendo.
2. Accede a la aplicación desde tu navegador en:  

  
http://localhost:3000


---

## *Enlace del Video de Sustentación*
[[[Ver video de sustentación del proyecto](https://drive.google.com/ejemplo)  ](https://drive.google.com/file/d/1dUmFXqXJ6MwvB0dBzOAocj_aZUJys7gR/view?usp=drive_link)

https://drive.google.com/file/d/1dUmFXqXJ6MwvB0dBzOAocj_aZUJys7gR/view?usp=drive_link

https://drive.google.com/file/d/1dUmFXqXJ6MwvB0dBzOAocj_aZUJys7gR/view?usp=drive_link
https://drive.google.com/file/d/1dUmFXqXJ6MwvB0dBzOAocj_aZUJys7gR/view?usp=drive_link


---

### *Notas Finales*
- Si descargas el archivo *ZIP*, extrae todo su contenido antes de continuar.
- Si usas Git, asegúrate de tener una conexión estable para clonar el repositorio.
- Practica las pruebas y verifica la correcta integración del frontend, backend y las bases de datos.
