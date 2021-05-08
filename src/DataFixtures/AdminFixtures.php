<?php

namespace App\DataFixtures;

use App\Entity\Role;
use App\Entity\User;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AdminFixtures extends Fixture
{
    private $encoder;
    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        $adminRole = new Role();
        $adminRole->setTitle('ROLE_ADMIN');
        $manager->persist($adminRole);

        $adminUser = new User();
        $hash = $this->encoder->encodePassword($adminUser, 'demo');
        $adminUser
            ->setUsername('demo')
            ->setLastname('L')
            ->setFirstname('F')
            ->setEmail('demo@free.fr')
            ->setPassword($hash)
            ->addUserRole($adminRole);

        $manager->persist($adminUser);
        $manager->flush();
    }
}
