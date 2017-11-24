<?php
	namespace OC\PlatformBundle\Controller;

	use Symfony\Component\HttpFoundation\Response;							// Importation de l'objet Response
	use Symfony\Bundle\FrameworkBundle\Controller\Controller;				// Importation du controller de base Symfony
	use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
	use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
	use Symfony\Component\HttpFoundation\Request;
	use OC\PlatformBundle\Entity\Advert;									// Importation de l'entité Advert
	use OC\PlatformBundle\Entity\Image;										// Importation de l'entité Image
	use OC\PlatformBundle\Entity\Skill;
	use OC\PlatformBundle\Entity\AdvertSkill;
	use OC\PlatformBundle\Entity\Application;


	// La classe doit hériter de Controller pour utiliser la méthode get()
	class AdvertController extends Controller {

		// METHODES HELLO WORLD :

	    public function helloAction ($page) {
	    	$url = $this->get('router')->generate('hello_world', array(), UrlGeneratorInterface::ABSOLUTE_URL);	
	        $retour = $this
	        	->get('templating')
	        	->render('OCPlatformBundle:Advert:hello.html.twig', array("nom" => "Walid", "url" => $url, 'page' => $page));
	    	return new Response($retour);
	    }

	    public function byeAction (Request $request) {
	    	$url = $this->get('router')->generate('hello_world', array(), UrlGeneratorInterface::ABSOLUTE_URL);
	    	$tag = $request->query->get('tag');
	        return new Response($this->get('templating')->render('OCPlatformBundle:Advert:bye.html.twig', array("nom" => "Walid", "url" => $url, "tag" => $tag)));
	        	// Même principe que helloAction mais sans passer par une variable intermediaire
	    }


	    // METHODES ACTION :

	    public function indexAction ($page) {
	    	$listAdverts = array(
	    		array(
	    			'title' => 'Recherche developpeur Symfony',
	    			'id' => 2,
	    			'author' => 'Sandrine',
	    			'content' => 'Bla bla bla...',
	    			'date' => new \Datetime() 
	    		),
	    		array(
	    			'title' => 'Mission webmaster',
	    			'id' => 5,
	    			'author' => 'Garry',
	    			'content' => 'Bla bla bla...',
	    			'date' => new \Datetime() 
	    		),
	    		array(
	    			'title' => 'Stage webdesigner',
	    			'id' => 9,
	    			'author' => 'Alexandre',
	    			'content' => 'Bla bla bla...',
	    			'date' => new \Datetime() 
	    		),
	    	);
	    	return $this->render('OCPlatformBundle:Advert:index.html.twig', array('listAdverts' => $listAdverts));
	    }

	    public function dateAction($annee, $mois, $jour) {
	    	return new Response("Affichage de l'annonce datée du <em>" . $jour . '/' . $mois . '/' . $annee . "</em>.");
	    }
	
	    public function viewAction($id) {
	    	$bdd = $this->getDoctrine()->getManager();
		    $advert = $bdd->getRepository('OCPlatformBundle:Advert')->find($id);
    		if ($advert === null) {
    			throw new NotFoundHttpException("Annonce " . $id . " introuvable.");
    		}
    		$listApplication = $bdd->getRepository('OCPlatformBundle:Application')->findBy(array('advert' => $advert));

			$listAdvertSkill = $bdd->getRepository('OCPlatformBundle:AdvertSkill')->findBy(array('advert' => $advert));

    		return $this->render('OCPlatformBundle:Advert:view.html.twig', array(
   				'advert' => $advert,
   				'listApplication' => $listApplication,
   				'listAdvertSkill' => $listAdvertSkill
   			));
		}

	    public function addAction () {
	    	return $this->render('OCPlatformBundle:Advert:add.html.twig');	    	
	    }

	    public function add2Action (Request $request) {
	    	$advert = new Advert();
	    	$advert->setTitle($request->request->get('title'));
	    	$advert->setContent($request->request->get('content'));
	    	$advert->setAuthor('Author Admin');
	    	// L'attribut author est defini en dur pour le moment
	    	$image = new Image();
	    	$image->setUrl('http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg');
	    	$image->setAlt('Job de rêve');
	    	// Création et remplissage de l'objet $image qu'on passera à l'objet $advert
	    	$advert->setImage($image);
	    	// Passage de l'objet $image à l'objet $advert
	    	$bdd = $this->getDoctrine()->getManager();
	    	// On recupere l'EntityManager
	    	$bdd->persist($advert);
	    	// Envois de l'annonce à Doctrine

	    	$antispam = $this->container->get('oc_platform.antispam');
	    	// Recuperation du service
	    	if ($antispam->isSpam($request->request->get('content'))) {
	    		throw new \Exception("Votre message a potentiellement été detecté comme spam ! (<5 char)", 1);
	    	} else {
	    		$bdd->flush();
	    		// Sauvegarde dans la bdd
	    	}


	    	return $this->redirectToRoute('oc_platform_view', array ('id' => $advert->getId()));
	    }

	    public function editAction ($id, Request $request) {
	    	$bdd = $this->getDoctrine()->getManager();
			$advert = $bdd->getRepository('OCPlatformBundle:Advert')->find($id);
	    	if ($advert == null) {
	    		throw new NotFoundHttpException("Annonce " . $id . "introuvable.");	    		
	    	}
	    	return $this->render('OCPlatformBundle:Advert:edit.html.twig', array('advert' => $advert));
	    }

	    public function edit2Action ($id, Request $request) {
	    	$bdd = $this->getDoctrine()->getManager();
			$advert = $bdd->getRepository('OCPlatformBundle:Advert')->find($id);
	    	if ($advert == null) {
	    		throw new NotFoundHttpException("Annonce " . $id . "introuvable.");	    		
	    	}

	    	$advert->setTitle($request->request->get('title'));
	    	$advert->setContent($request->request->get('content'));

	    	$bdd->persist($advert);

	    	$antispam = $this->container->get('oc_platform.antispam');
	    	// Recuperation du service
	    	if ($antispam->isSpam($request->request->get('content'))) {
	    		throw new \Exception("Votre message a potentiellement été detecté comme spam ! (<5 char)", 1);
	    	} else {
	    		$bdd->flush();
	    		// Sauvegarde dans la bdd
	    	}

	    	return $this->redirectToRoute('oc_platform_view', array ('id' => $advert->getId()));
	    }
 
	    public function deleteAction ($id) {
	    	$bdd = $this->getDoctrine()->getManager();
	    	$advert = $bdd->getRepository('OCPlatformBundle:Advert')->find($id);
	    	if ($advert == null) {
	    		throw new NotFoundHttpException("Annonce " . $id . " introuvable.");
	    	}
	    	return $this->render('OCPlatformBundle:Advert:delete.html.twig', array('advert' => $advert));
	    }
 
	    public function delete2Action ($id, Request $request) {
	    	$bdd = $this->getDoctrine()->getManager();
	    	$advert = $bdd->getRepository('OCPlatformBundle:Advert')->find($id);

	    	$bdd->remove($advert);
	    	$bdd->flush();

	    	$session = $request->getSession();
    		$session->getFlashBag()->add('info', 'Message flash : Votre annonce a bien été supprimée.');

	    	return $this->redirectToRoute('oc_core_home');
	    }

	    public function redirectAction() {	
	    	// return $this->redirect('http://google.fr/');
	    	// Redirection vers une URL

	    	return $this->redirectToRoute('hello_world');
	    	// Redirection vers une route de notre site
	    }

	    public function addRedirectAction (Request $request) {
	    	$session = $request->getSession();
	    	$session->getFlashBag()->add('info', 'Annonce bien enregistrée');
	    	$session->getFlashBag()->add('info', 'Annonce bien enregistrée [ep. 2]');
	    	return $this->redirectToRoute('oc_platform_view', array('id' => 5));
	    }

	    public function lastsAddsAction($limit) {
	    	$listAdverts = array(
	    		array('id' => 2, 'title' => 'Recherche développeur Symfony' ),
	    		array('id' => 5, 'title' => 'Mission de webmaster' ),
	    		array('id' => 9, 'title' => 'Offre de stage webdesigner' )
	    	);
	    	return $this->render('OCPlatformBundle:Advert:lastsAdds.html.twig', array('listAdverts' => $listAdverts));
	    }

	    public function testContainer() {
	    	$mailer = $this->container->get('mailer');
	    	return Response('Okay !');
	    }

	    public function monthAdsAction() {
	    	$bdd = $this->getDoctrine()->getManager();
	    	$adverts = $bdd->getRepository('OCPlatformBundle:Advert');

	    	$adverts = $adverts->whereCurrentMonth();

	    	return $this->render('OCPlatformBundle:Advert:index.html.twig', array('listAdverts' => $adverts));
	    }

	    public function categoriesAction() {
	    	$categories = ['Développeur', 'Intégrateur'];

	    	$bdd = $this->getDoctrine()->getManager();
	    	$adverts = $bdd->getRepository('OCPlatformBundle:Advert');
	    	$listAdverts = $adverts->getAdvertWithCategories($categories);

	    	return $this->render('OCPlatformBundle:Advert:categories.html.twig', array('listAdverts' => $listAdverts));
	    }
	}