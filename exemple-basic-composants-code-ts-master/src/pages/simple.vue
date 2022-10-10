<template>
  <div class="p-2">
    <!-- Static -->
    <h2 class="text-2xl">Paramètres passés en attribut :</h2>
    <ficheMaison
      surface="8x4.5m²"
      :nbr-lits="4"
      nomMaison="autre maison"
      :nbr-s-d-b="2"
      :prix="5000"
      :favori="true"
      image="/images-maisons/Beverly-Springfield.jpg"
      :adresse="{
        addressCountry: 'USA',
        addressRegion: 'TX',
        addressLocality: 'Palm Habor',
        postalCode: '2821',
        streetAddress: 'Lake Sevilla',
        postOfficeBoxNumber: '123',
      }"
    />
    <!-- Objet -->
    <h2 class="text-2xl">Tous les paramètres reçut en un seul objet</h2>
    <ficheMaison v-bind="maison1" />
  </div>
</template>
<script setup lang="ts">
import ficheMaison from "../components/ficheOffreMaison.vue";
import imageMaison1 from "../../public/images-maisons/Faulkner-Ave.png";

// Objet
const maison1 = {
  prix: 2701,
  image: imageMaison1,
  favori: true,
  nbrChambres: 4,
  nbrSDB: 2,
  nomMaison: "Beverly Springfield",
  adresse: {
    addressCountry: "USA",
    addressRegion: "TX",
    addressLocality: "Palm Habor",
    postalCode: "2821",
    streetAddress: "Lake Sevilla",
    postOfficeBoxNumber: "123",
  },
  surface: "7x6.5m²",
};
</script>
