
CREATE OR REPLACE TRIGGER updateArea
AFTER DELETE OR INSERT OR UPDATE ON student1
FOR EACH ROW
DECLARE
BEGIN 

	IF UPDATING THEN
		insert into student2@site_link2 values(:OLD.s_id,:OLD.name,:OLD.department,:OLD.email,:OLD.password,:NEW.city);
		update student set city = :NEW.city where s_id = :OLD.s_id;
	END IF;
END;
/  