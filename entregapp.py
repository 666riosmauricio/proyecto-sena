from flask import Flask, render_template, request, redirect, url_for, session, flash
from werkzeug.exceptions import HTTPException
import pymysql.cursors
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import getpass


app = Flask(__name__)
app.secret_key = "sk"


#index
@app.route('/')
def index():
    #sesion del usuario
    if 'usuario' in session:   
        usuario = session['usuario']
        return render_template('index.html')
    return render_template('index.html')

@app.route('/registro/',methods = ['GET','POST'])
def registro():
  
  if request.method == 'POST':
    NumeroDocumento= request.form['numeroDocumento']
    Nombres = request.form['nombre']
    Apellidos = request.form['apellidos']
    Email = request.form['email']
    Contraseña = request.form['password']
    Direccion = request.form['direccion']
    Telefono = request.form['telefono']
    Celular = request.form['celular']
    Telefono2 = request.form['telefono2']
    Celular2 = request.form['celular2']

    #conexion a la base de datos
    conn = pymysql.connect(
    host="localhost", port=3306, user="root",
    passwd="", db="entregapp")
    cursor = conn.cursor()
    cursor.execute("INSERT INTO usuarios (numeroDocumento,nombres,apellidos,email,password,direccion,telefono,celular,telefono2,celular2) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)", (
    NumeroDocumento,Nombres,Apellidos,Email,Contraseña,Direccion,Telefono,Celular,Telefono2,Celular2))
    conn.commit()
    conn.close()
    flash('mensaje exitoso')

    return redirect(url_for('index'))  
  return render_template('registro.html')

@app.route('/login/',methods = ['GET','POST'])
def login():
  if request.method == 'POST':
    #se recuperan datos del formulario
    usuario = request.form['email']
    password = request.form['password']
    #conexion a la base de datos
    conn = pymysql.connect(
    host="localhost", port=3306, user="root",
    passwd ="", db="Entregapp" )
    cursor = conn.cursor()
    cursor.execute("SELECT password,email FROM usuarios WHERE email=%s", (usuario))
    resultado = cursor.fetchone()
    conn.close()
    
    #si el usuario no existe..
    if resultado is None:
      flash('El usuario no esta registrado!! Por favor registrese')
      return  redirect(url_for('index'))
         
    #si el password coincide con el del usuario...
    if password == resultado[0]:
      #se crea la sesion del usuario
      session['usuario'] = usuario

      #si el correo corresponde a un usurio    
      flash('Bienvenido ' + usuario + ', a Domicilios Entregapp')
      return render_template('indexUsuario.html',nombres = usuario)  

      #si la contraseña es incorrecta  
    else:
      flash('usuario o contraseña incorrecta')
      return redirect(url_for('index'))

  return render_template('login.html')



if __name__ == '__main__':
   app.run(debug = True)

   """
contraseña = 'perra'
h = hashlib.md5 (contraseña.encode ())
print (h.hexdigest ())
   """