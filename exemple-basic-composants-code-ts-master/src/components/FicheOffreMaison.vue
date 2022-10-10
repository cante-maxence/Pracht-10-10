<script setup lang="ts">
import Bed from "./icones/Bed.vue";
import Bath from "./icones/Bath.vue";
import Size from "./icones/Size.vue";
import Heart from "./icones/Heart.vue";
import AddressRdf from "./AddressRdf.vue";
// import type { SchemaOffreMaison } from "../types";
// defineProps<SchemaOffreMaison>();

defineProps({
  id: String, //TODO type uuid
  /** nom du logement */
  nomMaison: String,
  prix: Number,
  favori: Boolean,
  image: String,
  /** nombre de lits du logement */
  nbrChambres: Number,
  /** nombre de salle de bain du logement */
  nbrSDB: Number,
  adresse: String,
  /** Surface habitable TODO: https://schema.org/floorSize ? */
  surface: String,
});
</script>

<template>
  <figure>
    <img class="h-48 w-full rounded-t-lg object-cover" :src="image" alt="" />
    <figcaption
      class="relative flex flex-col rounded-b-lg border-2 border-t-0 border-indigo-100 px-5 py-7"
    >
      <div
        class="absolute top-7 right-5 grid h-12 w-12 place-items-center rounded-full border-2 border-indigo-100"
      >
        <Heart :class="{ 'fill-red-300': favori }" />
      </div>
      <h3 class="text-2xl text-gray-900">{{ nomMaison }}</h3>
      <address>{{ adresse }}</address>
      <div class="order-first flex items-center">
        <div class="pr-1 text-2xl font-bold text-indigo-500">${{ prix }}</div>
        <div>/ months</div>
      </div>
      <hr class="my-4 border-t-2 border-indigo-100" />
      <div class="flex justify-between text-sm text-gray-500">
        <div><Bed class="inline-block pr-1" />{{ nbrChambres }}&nbsp;Beds</div>
        <div><Bath class="inline-block pr-1" />{{ nbrSDB }} Bathrooms</div>
        <div><Size class="inline-block pr-1" />{{ surface }}</div>
      </div>
    </figcaption>
  </figure>
</template>
