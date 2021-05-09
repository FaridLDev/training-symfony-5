<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210509143629 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE training ADD image_name VARCHAR(255) NOT NULL, ADD updated_at DATETIME NOT NULL');
        $this->addSql('DROP INDEX IDX_4FD3E78A3EB8070A ON training_course');
        $this->addSql('ALTER TABLE training_course DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE training_course CHANGE program_id course_id INT NOT NULL');
        $this->addSql('ALTER TABLE training_course ADD CONSTRAINT FK_2572A8D6BEFD98D1 FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE training_course ADD CONSTRAINT FK_2572A8D6591CC992 FOREIGN KEY (course_id) REFERENCES course (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_2572A8D6591CC992 ON training_course (course_id)');
        $this->addSql('ALTER TABLE training_course ADD PRIMARY KEY (training_id, course_id)');
        $this->addSql('DROP INDEX idx_4fd3e78abefd98d1 ON training_course');
        $this->addSql('CREATE INDEX IDX_2572A8D6BEFD98D1 ON training_course (training_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE training DROP image_name, DROP updated_at');
        $this->addSql('ALTER TABLE training_course DROP FOREIGN KEY FK_2572A8D6BEFD98D1');
        $this->addSql('ALTER TABLE training_course DROP FOREIGN KEY FK_2572A8D6591CC992');
        $this->addSql('DROP INDEX IDX_2572A8D6591CC992 ON training_course');
        $this->addSql('ALTER TABLE training_course DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE training_course DROP FOREIGN KEY FK_2572A8D6BEFD98D1');
        $this->addSql('ALTER TABLE training_course CHANGE course_id program_id INT NOT NULL');
        $this->addSql('CREATE INDEX IDX_4FD3E78A3EB8070A ON training_course (program_id)');
        $this->addSql('ALTER TABLE training_course ADD PRIMARY KEY (training_id, program_id)');
        $this->addSql('DROP INDEX idx_2572a8d6befd98d1 ON training_course');
        $this->addSql('CREATE INDEX IDX_4FD3E78ABEFD98D1 ON training_course (training_id)');
        $this->addSql('ALTER TABLE training_course ADD CONSTRAINT FK_2572A8D6BEFD98D1 FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE CASCADE');
    }
}
