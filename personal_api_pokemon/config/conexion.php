<?php
    class Conectar{
        protected$dbh;
        protected function Conexion(){
            try {
                $conecta=$this ->dbh=new PDO("mysql:local=localhost;dbname=pokeapi","root","admin");
                return $conecta;
            } catch (Exception $e) {
                print"error bd" . $e->getMessage()."<br/>";
                die();
            }

        }
        protected function set_names(){
            return $this ->dbh->query("SET NAMES 'utf8'");
        }
 
    }
?>