<script setup lang="ts">
import FicheOffreMaison from "../components/FicheOffreMaison.vue";
import { supabase } from "../supabase";
let { data: maisons, error } = await supabase.from("Maison").select("*");
console.log(maisons);
if (error) console.log("n'a pas pu charger le table Maison :", error);
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
