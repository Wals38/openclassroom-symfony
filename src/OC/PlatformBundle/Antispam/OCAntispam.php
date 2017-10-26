<?php

	namespace OC\PlatformBundle\Antispam;

	class OCAntispam {

		private $mailer;
		private $locale;
		private $minLength;


		public function __construct(\Swift_Mailer $mailer, $locale, $minLength) {
			$this->mailer = $mailer;
			$this->locale = $locale;
			$this->minLength = (int) $minLength;
		}

		public function isSpam ($text) {
			if (strlen($text)<5) {
				return true;
			} else {
				return false;
			}
			// return strlen($text) < 50;			// Même resultat que le if plus haut
		}
	}