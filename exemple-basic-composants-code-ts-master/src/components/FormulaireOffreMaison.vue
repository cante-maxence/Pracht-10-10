<script setup lang="ts">
import groupBy from "lodash/groupBy";
import { ref } from "@vue/reactivity";
import { supabase } from "../supabase";
import FicheOffreMaison from "./FicheOffreMaison.vue";
import { useRouter } from "vue-router";
const router = useRouter();
// On fait une variable réactive qui référence les données
// ATTENTION : faire une Ref pas une Reactive car :
// c'est l'objet qui doit être réactif, pas ses props
const maison = ref({});
const props = defineProps(["id"]);
if (props.id) {
  // On charge les données de la maison
  let { data, error } = await supabase
    .from("Maison")
    .select("*")
    .eq("id", props.id);
  if (error || !data)
    console.log("n'a pas pu charger le table Maison :", error);
  else maison.value = data[0];
}
async function upsertMaison(dataForm, node) {
  const { data, error } = await supabase.from("Maison").upsert(dataForm);
  if (error) node.setErrors([error.message]);
  else {
    node.setErrors([]);
    router.push({ name: "edit-id", params: { id: data[0].id } });
  }
}
const { data: dataQuartierCommune, error } = await supabase
  .from("quartiercommune")
  .select("*");
if (error) console.log("n'a pas pu charger la vue quartiercommune :", error);
</script>
<template>
  <div>
    <div class="p-2">
      <h2 class="text-2xl">Résultat (Prévisualisation)</h2>
      <!-- Optionnel on affiche les données -->
      <FicheOffreMaison v-bind="maison" />
    </div>
    <div class="p-2">
      <!-- On passe la "ref" à FormKit -->
      <FormKit
        type="form"
        v-model="maison"
        :config="{
          classes: {
            input: 'p-1 rounded border-gray-300 shadow-sm border',
            label: 'text-gray-600',
          },
        }"
        :submit-attrs="{ classes: { input: 'bg-red-300 p-1 rounded' } }"
        @submit="upsertMaison"
      >
        <FormKit name="nomMaison" label="nom" />
        <FormKit name="prix" label="prix" type="number" />
        <FormKit name="surface" label="surface" />
        <FormKit name="nbrChambres" label="nbr de chambres" type="number" />
        <FormKit name="nbrSDB" label="nbr de SDB" type="number" />
        <FormKit name="adresse" label="adresse" />
        <FormKit name="image" label="image" />
        <FormKit name="code_Quartier" label="Quartier" type="select">
          <option value="" :disabled="true">Choisir un quartier</option>
          <optgroup
            v-for="(listeQuartier, libelleCommune) in groupBy(
              dataQuartierCommune,
              'libelle_Commune'
            )"
            :label="`Commune : ${libelleCommune}`"
          >
            <option
              v-for="quartier in listeQuartier"
              :key="quartier.code_Quartier"
              :value="quartier.code_Quartier"
            >
              {{ quartier.libelle_Quartier }}
            </option>
          </optgroup>
        </FormKit>
      </FormKit>
    </div>
  </div>
</template>
