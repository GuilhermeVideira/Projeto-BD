create database bd_ficha;
use bd_ficha;

describe tb_jovem;
select * from tb_jovem;

create table tb_filiacao(
cd_filial int auto_increment,
nm_pai varchar(45) not null,
nm_mae varchar(45) not null,
primary key(cd_filial)
);

create table tb_moradia(
cd_moradia int auto_increment,
nm_endereco varchar(45) not null,
nr_enderco int not null,
nr_apto varchar(4) not null,
nm_bairro varchar(45) not null,
nm_condodominio varchar(45) not null,
ds_ponto_referencia longtext,
primary key (cd_moradia)
);

create table tb_igreja(
cd_igreja int auto_increment,
nm_igreja varchar(45) not null,
nm_distrito varchar(45) not null,
primary key(cd_igreja)
);

create table tb_habilidade(
cd_habilidade int auto_increment,
nm_habilidade varchar(45) not null,
dt_habilidade date,
primary key(cd_habilidade)
);

create table tb_curso(
cd_curso int auto_increment,
nm_curso varchar(45) not null,
dt_curso date,
primary key(cd_curso)
);

create table tb_curso_leitura(
cd_curso_leitura int auto_increment,
nm_livro_curso_leitura int not null,
dt_curso_leitura date,
aa_blibico year,
dt_blibico date,
primary key (cd_curso_leitura)
);

create table tb_lideranca(
cd_lideranca int auto_increment,
nm_classe varchar(45) not null,
dt_lideranca date,
primary key(cd_lideranca)
);

create table tb_medalha(
cd_medalha int auto_increment,
nm_medalha varchar(45) not null,
dt_medalhatb_jovem date,
primary key(cd_medalha)
);

create table tb_jovem(
nr_cpf_jovem char(11),
nm_jovem varchar(45) not null,
nr_rg_jovem char(9) not null,
sg_orgao_expedidor_rg_jovem char(2) not null,
dt_nascimento_jovem date,
id_adventista_jovem bit,
dt_batismo_jovem date,
nm_profissao_jovem varchar(45),
nm_escolaridade_jovem varchar(45),
fk_cd_filial int,
fk_cd_moradia int,
fk_cd_igreja int,
primary key (nr_cpf_jovem),
foreign key (fk_cd_filial) references tb_fliliacao(cd_filial),
foreign key (fk_cd_moradia) references tb_moradia(cd_moradia),
foreign key (fk_cd_igreja) references tb_igreja(cd_igreja)
);

create table tb_saude(
cd_saude int auto_increment,
nm_grupo_sanguineo char(2) not null,
id_fator_rg bit not null,
id_vacina_tetano int,
id_molestia bit,
mn_molestia varchar(45),
ds_alergia longtext,
id_medicamento bit,
nm_medicamentos longtext,
ds_observacao longtext,
fk_nr_cpf_jovem char(11),
primary key (cd_saude),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem)
);

create table tb_contato(
cd_contato int auto_increment,
nr_telefone char(10) not null,
id_tipo_telefone bit not null,
nm_recado varchar(20),
nr_celular char(11) not null,
nm_email varchar(45) not null,
nm_msn varchar(45),
fk_nr_cpf_jovem char(11),
primary key (cd_contato),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem)
);

create table tb_jovem_habilidade(
cd_jovem_habilidade int auto_increment,
fk_nr_cpf_jovem char(11),
fk_cd_habilidade int,
primary key(cd_jovem_habilidade),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem),
foreign key (fk_cd_habilidade) references tb_habilidade(cd_habilidade)
);

create table tb_jovem_curso(
cd_jovem_curso int auto_increment,
fk_nr_cpf_jovem char(11),
fk_cd_curso int,
primary key(cd_jovem_curso),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem),
foreign key (fk_cd_curso) references tb_curso(cd_curso)
);

create table tb_jovem_curso_leitura(
cd_jovem_curso_leitura int auto_increment,
fk_nr_cpf_jovem char(11),
fk_cd_curso_leitura int,
primary key(cd_jovem_curso_leitura),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem),
foreign key (fk_cd_curso_leitura) references tb_curso_leitura(cd_curso_leitura)
);

create table tb_jovem_lideranca(
cd_jovem_lideranca int auto_increment,
fk_nr_cpf_jovem char(11),
fk_cd_lideranca int,
primary key(cd_jovem_lideranca),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem),
foreign key (fk_cd_lideranca) references tb_lideranca(cd_lideranca)
);

create table tb_jovem_medalha(
cd_jovem_medalha int auto_increment,
fk_nr_cpf_jovem char(11),
fk_cd_medalha int,
primary key(cd_jovem_medalha),
foreign key (fk_nr_cpf_jovem) references tb_jovem(nr_cpf_jovem),
foreign key (fk_cd_medalha) references tb_medalha(cd_medalha)
);

