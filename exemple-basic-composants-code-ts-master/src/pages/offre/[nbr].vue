<script setup lang="ts">
import FicheOffreMaison from "../../components/FicheOffreMaison.vue";
import maisons from "../../assets/maisons.json";
defineProps<{ nbr: string }>();
</script>
<template>
  <div class="p-2">
    <FicheOffreMaison v-bind="maisons[Number(nbr)]" />
  </div>
</template>
