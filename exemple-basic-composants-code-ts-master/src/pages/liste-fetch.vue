<script setup lang="ts">
import FicheOffreMaison from "../components/FicheOffreMaison.vue";
const res = await fetch("/maisons-public.json");
const maisons = await res.json();
</script>
<template>
  <div class="p-2">
    <FicheOffreMaison
      v-for="maison in maisons"
      :key="maison.nomMaison"
      v-bind="maison"
    />
  </div>
</template>
