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
        return render_template('index.html', nombres=usuario)
    return render_template('index.html')

@app.route('/registro')
def registro():
    return render_template('registro.html')


if __name__ == '__main__':
   app.run(debug = True)