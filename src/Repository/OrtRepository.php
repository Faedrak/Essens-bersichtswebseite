<?php

namespace App\Repository;

use App\Entity\Ort;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Ort|null find($id, $lockMode = null, $lockVersion = null)
 * @method Ort|null findOneBy(array $criteria, array $orderBy = null)
 * @method Ort[]    findAll()
 * @method Ort[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrtRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Ort::class);
    }

    // /**
    //  * @return Ort[] Returns an array of Ort objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('o')
            ->andWhere('o.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('o.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Ort
    {
        return $this->createQueryBuilder('o')
            ->andWhere('o.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
