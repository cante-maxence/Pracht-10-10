<script setup lang="ts">
import { Ref, ref } from "vue";
import { useRouter } from "vue-router";
import { supabase } from "../supabase";
const router = useRouter();
const props = defineProps<{
  id?: string;
}>();
// TODO: ajout type Quartier
const quartierObject: Ref<any> = ref({});
if (props.id) {
  // On charge les données de la vue quartiercommune
  let { data, error } = await supabase
    .from("Quartier")
    .select("*")
    .eq("code_Quartier", props.id);
  if (error || !data)
    console.log("n'a pas pu charger le table Maison :", error);
  else quartierObject.value = data[0];
}
async function upsertQuartierCommune(dataForm, node) {
  const { data, error } = await supabase.from("Quartier").upsert(dataForm);
  if (error) node.setErrors([error.message]);
  else {
    node.setErrors([]);
    router.push({ name: "quartier-id", params: { id: data[0].code_Quartier } });
  }
}
// Charger les données des communes
const { data: listeCommune, error } = await supabase
  .from("Commune")
  .select("*");
if (error) console.log("n'a pas pu charger la table Commune :", error);
// Les convertir par `map` en un tableau d'objets {value, label} pour FormKit
const optionsCommune = listeCommune?.map((commune) => ({
  value: commune.code_Commune,
  label: commune.libelle_Commune,
}));

async function supprimerQuartier() {
  const { data, error } = await supabase
    .from("Quartier")
    .delete()
    .match({ code_Quartier: quartierObject.value.code_Quartier });
  if (error) {
    console.error(
      "Erreur à la suppression de ",
      quartierObject.value,
      "erreur :",
      error
    );
  } else {
    router.push("/quartier");
  }
}
</script>
<template>
  <div class="p-2">
    <RouterLink to="/quartier">Retour à la liste des quartiers</RouterLink>
    <FormKit
      @submit="upsertQuartierCommune"
      type="form"
      v-model="quartierObject"
    >
      <FormKit name="libelle_Quartier" label="Nom du quartier" />
      <!-- Affiche les communes avec comme valeur l'id de la relation -->
      <FormKit
        type="select"
        name="code_Commune"
        label="Commune"
        :options="optionsCommune"
      />
      <button
        type="button"
        v-if="quartierObject.code_Quartier"
        @click="($refs.dialogSupprimer as any).showModal()"
        class="focus-style justify-self-end rounded-md bg-red-500 p-2 shadow-sm"
      >
        Supprimer l'offre
      </button>
      <dialog
        ref="dialogSupprimer"
        @click="($event.currentTarget as any).close()"
      >
        <button
          type="button"
          class="focus-style justify-self-end rounded-md bg-blue-300 p-2 shadow-sm"
        >
          Annuler</button
        ><button
          type="button"
          @click="supprimerQuartier()"
          class="focus-style rounded-md bg-red-500 p-2 shadow-sm"
        >
          Confirmer suppression
        </button>
      </dialog>
    </FormKit>
  </div>
</template>
