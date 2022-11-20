DELIMITER $$

CREATE TRIGGER onInchiriereInsert BEFORE INSERT ON tblInchiriere
FOR EACH ROW
BEGIN
    UPDATE tblMasina
    SET idLocatieActuala = NULL
    WHERE idMasina = NEW.idMasina;
END$$

CREATE TRIGGER onInchiriereUpdate BEFORE UPDATE ON tblInchiriere
FOR EACH ROW
BEGIN
    UPDATE tblMasina
    SET idLocatieActuala = NEW.idLocatiePredare
    WHERE idMasina = NEW.idMasina AND NEW.dataPredareEfectiva IS NOT NULL;
END$$

CREATE TRIGGER onInchiriereDelete BEFORE DELETE ON tblInchiriere
FOR EACH ROW
BEGIN
    UPDATE tblMasina
    SET idLocatieActuala = OLD.idLocatiePredare
    WHERE idMasina = OLD.idMasina;
END$$

CREATE TRIGGER tblInchiriere_no_overlap
BEFORE INSERT ON tblInchiriere
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT * FROM tblInchiriere
             WHERE dataInchiriere <= new.dataPredareLimita
             AND dataPredareLimita >= new.dataInchiriere AND idMasina = new.idMasina) THEN
        SET @marca = (SELECT marca from tblMasina where idMasina = new.idMasina);
        SET @model = (SELECT model from tblMasina where idMasina = new.idMasina);
        SET @nrInmatriculare = (SELECT nrInmatriculare from tblMasina where idMasina = new.idMasina);
        SET @masina = CONCAT(" `", @marca, " ", @model, "` cu nr. de inmatriculare `", @nrInmatriculare, "` ");
        SET @message = CONCAT('Masina', @masina, 'este deja inchiriata in acea perioada!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
  END IF;
END$$

DELIMITER ;