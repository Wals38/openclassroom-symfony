<?php
namespace OC\PlatformBundle\DoctrineListener;

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use OC\PlatformBundle\Email\ApplicationMailer;
use OC\PlatformBundle\Entity\Application;

class ApplicationCreationListener {
    /**
    * @var ApplicationMailer
    */
    private $applicationMailer;

    public function __construct(ApplicationMailer $applicationMailer) {
        $this->applicationMailer = $applicationMailer;
    }

    public function postPersist(LifecycleEventArgs $args) {
        $entity = $args->getObject();
        // getObject renvoit l'entité sur laquelle l'evenement est en train de se produire
        // getObjectManager est aussi utilisable pour récuperer l'entityManager correspondant et pouvoir persister ou supr de nouvelles entités

        if (!$entity instanceof Application) {
            return;
        }

        $this->applicationMailer->sendNewNotification($entity);
    }
}
