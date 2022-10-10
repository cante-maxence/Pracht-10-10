<script setup lang="ts">
import FormulaireOffreMaison from "../../components/FormulaireOffreMaison.vue";
defineProps(["id"]);
</script>
<template>
  <div class="p-2">
    <FormulaireOffreMaison :id="id" />
  </div>
</template>
