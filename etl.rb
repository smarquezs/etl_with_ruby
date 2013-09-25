# encoding: UTF-8


require 'pg'
require 'mysql'


con_my = Mysql.new('localhost','root','123qwe','ingrafprod')

result = con_my.query('SELECT * FROM in_sostenedor')

con_pg = PGconn.connect('localhost',5432,nil,nil,'prueba','user_test','123qwe')

result.each_hash do |r|
  rut = r['rut_sostenedor']
  ape_paterno = r['apellido_paterno']
  ape_materno = r['apellido_materno']
  nombre = r['nombres']
  direccion = r['direccion']
  
  sql = "INSERT INTO sostenedores  (rut_sostenedor,apellido_paterno,apellido_materno,nombres,direccion) VALUES ('#{rut}','#{ape_paterno}','#{ape_materno}','#{nombre}','#{direccion}')" 
  
  #puts sql
  con_pg.exec(sql)
end
