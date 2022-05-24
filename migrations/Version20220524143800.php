<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220524143800 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE bestellung (id INT AUTO_INCREMENT NOT NULL, sammel_bestellung_id INT NOT NULL, gast_name VARCHAR(255) NOT NULL, INDEX IDX_150D4EEC4A211314 (sammel_bestellung_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bestellung_gericht_variation (bestellung_id INT NOT NULL, gericht_variation_id INT NOT NULL, INDEX IDX_B1F1F96FD6F2F2D7 (bestellung_id), INDEX IDX_B1F1F96F202CE121 (gericht_variation_id), PRIMARY KEY(bestellung_id, gericht_variation_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gericht (id INT AUTO_INCREMENT NOT NULL, restaurant_id INT NOT NULL, kategorie_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, nummer VARCHAR(255) DEFAULT NULL, beschreibung LONGTEXT DEFAULT NULL, INDEX IDX_FEA51929B1E7706E (restaurant_id), INDEX IDX_FEA51929BAF991D3 (kategorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gericht_variation (id INT AUTO_INCREMENT NOT NULL, gericht_id INT NOT NULL, name VARCHAR(255) DEFAULT NULL, is_default TINYINT(1) DEFAULT 0 NOT NULL, preis NUMERIC(5, 2) NOT NULL, geloescht TINYINT(1) NOT NULL, INDEX IDX_4AC0E6AB6C6146DE (gericht_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE kategorie (id INT AUTO_INCREMENT NOT NULL, bezeichner VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ort (id INT AUTO_INCREMENT NOT NULL, plz INT NOT NULL, ort VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE restaurant (id INT AUTO_INCREMENT NOT NULL, ort_id INT NOT NULL, name VARCHAR(255) NOT NULL, telefon_nr VARCHAR(255) NOT NULL, mobil VARCHAR(255) DEFAULT NULL, straße VARCHAR(255) NOT NULL, haus_nr VARCHAR(255) NOT NULL, oeffnungszeit LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:json)\', INDEX IDX_EB95123FB62F846A (ort_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sammel_bestellung (id INT AUTO_INCREMENT NOT NULL, restaurant_id INT NOT NULL, admin_url VARCHAR(255) NOT NULL, public_url VARCHAR(255) NOT NULL, ist_offen TINYINT(1) DEFAULT NULL, INDEX IDX_CFBAF77DB1E7706E (restaurant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_8D93D649F85E0677 (username), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE bestellung ADD CONSTRAINT FK_150D4EEC4A211314 FOREIGN KEY (sammel_bestellung_id) REFERENCES sammel_bestellung (id)');
        $this->addSql('ALTER TABLE bestellung_gericht_variation ADD CONSTRAINT FK_B1F1F96FD6F2F2D7 FOREIGN KEY (bestellung_id) REFERENCES bestellung (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE bestellung_gericht_variation ADD CONSTRAINT FK_B1F1F96F202CE121 FOREIGN KEY (gericht_variation_id) REFERENCES gericht_variation (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gericht ADD CONSTRAINT FK_FEA51929B1E7706E FOREIGN KEY (restaurant_id) REFERENCES restaurant (id)');
        $this->addSql('ALTER TABLE gericht ADD CONSTRAINT FK_FEA51929BAF991D3 FOREIGN KEY (kategorie_id) REFERENCES kategorie (id)');
        $this->addSql('ALTER TABLE gericht_variation ADD CONSTRAINT FK_4AC0E6AB6C6146DE FOREIGN KEY (gericht_id) REFERENCES gericht (id)');
        $this->addSql('ALTER TABLE restaurant ADD CONSTRAINT FK_EB95123FB62F846A FOREIGN KEY (ort_id) REFERENCES ort (id)');
        $this->addSql('ALTER TABLE sammel_bestellung ADD CONSTRAINT FK_CFBAF77DB1E7706E FOREIGN KEY (restaurant_id) REFERENCES restaurant (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE bestellung_gericht_variation DROP FOREIGN KEY FK_B1F1F96FD6F2F2D7');
        $this->addSql('ALTER TABLE gericht_variation DROP FOREIGN KEY FK_4AC0E6AB6C6146DE');
        $this->addSql('ALTER TABLE bestellung_gericht_variation DROP FOREIGN KEY FK_B1F1F96F202CE121');
        $this->addSql('ALTER TABLE gericht DROP FOREIGN KEY FK_FEA51929BAF991D3');
        $this->addSql('ALTER TABLE restaurant DROP FOREIGN KEY FK_EB95123FB62F846A');
        $this->addSql('ALTER TABLE gericht DROP FOREIGN KEY FK_FEA51929B1E7706E');
        $this->addSql('ALTER TABLE sammel_bestellung DROP FOREIGN KEY FK_CFBAF77DB1E7706E');
        $this->addSql('ALTER TABLE bestellung DROP FOREIGN KEY FK_150D4EEC4A211314');
        $this->addSql('DROP TABLE bestellung');
        $this->addSql('DROP TABLE bestellung_gericht_variation');
        $this->addSql('DROP TABLE gericht');
        $this->addSql('DROP TABLE gericht_variation');
        $this->addSql('DROP TABLE kategorie');
        $this->addSql('DROP TABLE ort');
        $this->addSql('DROP TABLE restaurant');
        $this->addSql('DROP TABLE sammel_bestellung');
        $this->addSql('DROP TABLE user');
    }
}
