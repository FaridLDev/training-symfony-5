<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210508123001 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE training_course (training_id INT NOT NULL, course_id INT NOT NULL, INDEX IDX_2572A8D6BEFD98D1 (training_id), INDEX IDX_2572A8D6591CC992 (course_id), PRIMARY KEY(training_id, course_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE training_user (training_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_8209910ABEFD98D1 (training_id), INDEX IDX_8209910AA76ED395 (user_id), PRIMARY KEY(training_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE training_course ADD CONSTRAINT FK_2572A8D6BEFD98D1 FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE training_course ADD CONSTRAINT FK_2572A8D6591CC992 FOREIGN KEY (course_id) REFERENCES course (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE training_user ADD CONSTRAINT FK_8209910ABEFD98D1 FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE training_user ADD CONSTRAINT FK_8209910AA76ED395 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE training_course');
        $this->addSql('DROP TABLE training_user');
    }
}
