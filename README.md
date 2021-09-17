# Parcial_-1

1) primerpunto

CREATE OR REPLACE FUNCTION log_employeecaudit_insert( )
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'insert', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
	RETURN NEW;
END;
$$

/* Insertar */
CREATE TRIGGER Trg_I_Employee
   AFTER insert
  ON employee
  FOR EACH ROW
EXECUTE PROCEDURE log_employeecaudit_insert();
 

CREATE OR REPLACE FUNCTION log_employeecaudit_update( )
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'update', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
	RETURN NEW;
END;
$$

/* Actualizar */
  CREATE TRIGGER Trg_U_Employee
   AFTER update
  ON employee
  FOR EACH ROW
  EXECUTE PROCEDURE log_employeecaudit_update();



CREATE OR REPLACE FUNCTION log_employeecaudit_delete( )
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'delete', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
	RETURN NEW;
END;
$$
  /* Eliminar */
  CREATE TRIGGER Trg_D_Employee
   AFTER delete
  ON employee
  FOR EACH ROW
  EXECUTE PROCEDURE log_employeecaudit_delete();
  
  
  select * from employee;
  
   select * from employeeaudit;
