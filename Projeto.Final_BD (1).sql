Create database action_fire;
use action_fire;

create table empresas_clientesrj (
id_empresa INT UNSIGNED NOT NULL AUTO_INCREMENT,
Nome_empresa varchar (50) not null, 
proprietario varchar (30) not null,
telefone varchar (15) not null,
cnpj int (11) not null,
email varchar(70),
 primary key (id_empresa)

);

CREATE TABLE vendedores (
 id_vendedor INT UNSIGNED NOT NULL AUTO_INCREMENT,
 vendedores varchar (50) not null,
 cpf varchar (16) not null,
 telefone varchar (15),
 email varchar (70) ,
 primary key (id_vendedor)
 );

 create table recarga_valoresbases (
 id_recvalbase INT UNSIGNED NOT NULL AUTO_INCREMENT,
 extintores_acessorios varchar (20),
 recarga_reposiçao varchar (10),
 primary key (id_recvalbase)
 );

create table recargas (
 id_recarga INT UNSIGNED NOT NULL AUTO_INCREMENT,
 ultima_recarga date not null,
 id_vendedor INT UNSIGNED DEFAULT NULL,
 id_empresa INT UNSIGNED DEFAULT NULL,
 proxima_recarga date not null,
 primary key (id_recarga),
 constraint fk_recargas_empresas_clientesrj foreign key (id_empresa) references empresas_clientesrj (id_empresa),
 constraint fk_recargas_vendedores foreign key (id_vendedor) references vendedores (id_vendedor)
  );
 
 create table quantidades_ext (
 id_qtsext INT UNSIGNED NOT NULL AUTO_INCREMENT,
 id_empresa INT UNSIGNED DEFAULT NULL,
 extintor_ap int (5),
 extintor_pqs int (5),
 extintor_co2 int (5),
  primary key (id_qtsext),
 constraint fk_id_empresa foreign key (id_empresa) references empresas_clientesrj (id_empresa)
 );
 

 
 create table pedidos (
 id_pedidos INT UNSIGNED NOT NULL AUTO_INCREMENT,
 id_vendedor INT UNSIGNED DEFAULT NULL,
  id_recvalbase int unsigned default null,
  valor int not null,
nf varchar (10),
 data_de_emissao date not null,
 primary key (id_pedidos),
 id_vendedores int null, 
 constraint fk_pedidos_vendedores foreign key (id_vendedor) references vendedores (id_vendedor),
  constraint fk_pedidos_recarga_valoresbase foreign key (id_recvalbase) references recarga_valoresbases (id_recvalbase)
 );
 
INSERT INTO empresas_clientesrj(Nome_empresa,proprietario,telefone,cnpj,email)
VALUES 
('trillormaquinasindecomltda','edvarfernandesdossantos','2198743210','123456','trillor_maq@hotmail.com'),
('nallin','rosaneferreiraalfradique','2198743211','123457','nallin_sualoja@hotmail.com'),
('clinicadrsoares','josuésoares','2198743212','123458','clinica_soares@hotmail.com'),
('supermercadoguanabara','yanmaiadacosta','2198743213','123459','guanab_maua@hotmail.com'),
('autoescolarelampago','marcelomendesdossantos','2198743214','123410','relamp_autesc@hotmail.com'),
('bardojp','ivoramossampaio','2198743215','123411','jp_bares@hotmail.com'),
('academiagymcenter','julianapimentel','2198743216','123412','gym_center@hotmail.com'),
('restaurantedoisirmãos','tatianarochadossantos','2198743217','123413','dois_irmaos@hotmail.com'),
('postodegasolinapenaestrada','adrieldejesussodré','2198743218','123414','postope_estrada@hotmail.com'),
('Redeeconomia','marioandréjunior','2198743219','123415','rede_econ@hotmail.com');


INSERT INTO vendedores (vendedores,cpf,telefone,email)
VALUES
('ALMIRSOUSACRUZFILHOJOSÉ','111.222.33-467','212555-3793','almir_souza@hotmail.com'),
('CARLOSMAIADESOUZAYAN','211.222.33-41','212555-3795','carlosmaia23@hotmail.com'),
('PEREIRASANTOSDENNER','111.224.383-42','212555-3795','pereira_santos06@hotmail.com'),
('SOARESJOSUÉ','111.222.367-50','212555-3795','josuesoares23@hotmail.com'),
('AUGUSTORAMOSMARCEL','111.222.333-48','212555-3795','augus_ramos@hotmail.com'),
('DASILVAGUSTAVO','111.222.393-80','212555-3795','gustavo_silv@hotmail.com'),
('JOSEDASILVA','111.111.121-70','212555-3790','jose_2022@hotmail.com'),
('GABRIELSALVADOR','222.222.212-09','212555-4554','salvador_zika@hotmail.com'),
('RENATOMAYA','333.333.332-10','212345-2345','renatin_bolado@hotmail.com'),
('JUVENALCOLASSO','444.444.442-31','214563-8394','juvejogadocaro@hotmail.com');


    INSERT INTO recarga_valoresbases( extintores_acessorios, recarga_reposiçao)
VALUES
('ap',70),
('co2',60),
('pqs',85),
('mangote',75),
('alça_de_transporte',60),
('manometro',90),
('difusor',85),
('tubo_cifao',70),
('gatilho',65),
('ap',65);

 INSERT INTO recargas(Id_Vendedor, Id_empresa, ultima_recarga, proxima_recarga)
VALUES
(1,1,'2021/01/12','2022/01/15'),
(2,2,'2021/03/02','2022/03/02'),
(3,3,'2021/04/21','2022/04/21'),
(4,4,'2021/11/12','2022/11/12'),
(5,5,'2021/05/03','2022/05/03'),
(6,6,'2021/05/21','2022/05/21'),
(7,7,'2021/06/30','2022/06/30'),
(8,8,'2021/10/10','2022/10/10'),
(9,9,'2021/12/14','2022/12/12'),
(10,10,'2021/07/14','2022/07/14');

 insert into pedidos (id_vendedor,id_recvalbase,valor,nf,data_de_emissao)
 values
 (1,1,1690,11111,'2021/10/12'),
 (2,2,1920,22222,'2021/11/02'),
 (3,3,1150,33333,'2021/12/21'),
(4,4,540,44444,'2021/11/12'),
 (5,5,2225,55555,'2021/05/03'),
(6,6,2050,66666,'2021/05/21'),
(7,7,1425,77777,'2021/06/30'),
(8,8,1220,88888,'2021/10/10'),
(9,9,810,99999,'2021/12/12'),
(10,10,2320,10101,'2021/07/14');
  
   insert into quantidades_ext(id_empresa,extintor_ap,extintor_pqs,extintor_co2)
 values
 (1,12,5,8),
(2,8,10,10),
(3,8,4,5),
(4,4,2,2),
(5,15,10,8),
(6,10,10,10),
(7,9,7,5),
(8,8,6,4),
(9,6,4,2),
(10,12,14,8);

 select nome_empresa, proprietario, email from empresas_clientesrj;
 
update empresas_clientesrj set email = 'nallin_nossaloja@hotmail.com'
where id_empresa = '2';
select email from empresas_clientesrj;

delete from quantidades_ext where id_empresa = 6;
delete from recargas where id_empresa = 6;


ALTER TABLE recarga_valoresbases
ADD COLUMN porcentagem_de_lucro INT(10);

DELIMITER $$

CREATE PROCEDURE clientes()


BEGIN
	SELECT *  FROM empresas_clientesrj,recargas
    WHERE empresas_clientesrj.id_empresa = recargas.id_recarga;
END $$

DELIMITER ;

create view serviços_actionfire as select nome_empresa, extintor_ap,extintor_pqs,extintor_co2,ultima_recarga,proxima_recarga from empresas_clientesrj,recargas
inner join quantidades_ext
where empresas_clientesrj.id_empresa = quantidades_ext.id_qtsext;





 
 







