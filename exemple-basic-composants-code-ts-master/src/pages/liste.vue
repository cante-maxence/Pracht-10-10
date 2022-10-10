<script setup lang="ts">
import FicheOffreMaison from "../components/FicheOffreMaison.vue";
import maisons from "../assets/maisons.json";
// Possible de le remplacer par :
// const maisons = [ {/* Obj 1re maison */}, { /* Obj 2nd */ }, /* ... */  ];
</script>
<template>
  <div class="p-2">
    <!-- <FicheOffreMaison v-bind="maisons[0]" />
    <FicheOffreMaison v-bind="maisons[1]" /> -->
    <FicheOffreMaison
      v-for="maison in maisons"
      :key="maison.nomMaison"
      v-bind="maison"
    />
  </div>
</template>
