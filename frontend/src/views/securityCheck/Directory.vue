<template>
  <v-navigation-drawer
    v-if="$vuetify.breakpoint.mdAndUp"
    width="300"
    app
    :style="{'margin-top': tabBarHeight + 'px'}"
  >
    <v-list shaped>
      <v-subheader>安检须知</v-subheader>
      <v-list-item-group color="primary">
        <v-list-item
          v-for="(item, i) in $store.state.securityCheckTips"
          :key="i"
          @click="itemClick(i)"
        >
          <v-list-item-icon>
            <v-icon>mdi-file-document-edit-outline</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { tabBarHeight } from "@/common/const.js";

export default {
  data: () => ({
    tabBarHeight
  }),
  methods: {
    itemClick(index) {
      this.$store.commit("setCurrentShowedTips", index);
      this.$vuetify.goTo(0, { duration: 0 });
    }
  }
};
</script>
