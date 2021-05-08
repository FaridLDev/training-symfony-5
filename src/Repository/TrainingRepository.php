<?php

namespace App\Repository;

use App\Entity\Training;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Training|null find($id, $lockMode = null, $lockVersion = null)
 * @method Training|null findOneBy(array $criteria, array $orderBy = null)
 * @method Training[]    findAll()
 * @method Training[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TrainingRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Training::class);
    }

    public function findCandidates()
    {
        return $this->createQueryBuilder('t')
            ->select(
                ' t.id, t.title, t.location, t.startDate, t.candidates, t.description, t.picture, count(u.id) as demande, count(u.validation) as validation'
            )
            ->leftJoin('t.clients', 'u')
            ->groupBy('t.title')
            ->getQuery()
            ->getResult();
    }
}
