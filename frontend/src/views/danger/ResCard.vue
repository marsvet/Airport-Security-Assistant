<template>
  <div>
    <v-card :loading="loading">
      <v-row class="ma-0">
        <v-col cols="12" md="6" class="pa-0 pa-md-4">
          <v-img contain :src="server + res.imgAddress"></v-img>
        </v-col>
        <v-col cols="12" md="6">
          <v-list>
            <v-subheader class="title mb-2">{{ res.resName }}</v-subheader>
            <v-divider class="mb-3"></v-divider>
            <v-list-item>
              <v-list-item-content>物品名称：</v-list-item-content>
              <v-list-item-content class="align-end">{{ res.resName }}</v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>附加说明：</v-list-item-content>
              <v-list-item-content class="align-end">{{ res.resDescription }}</v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>限定规格：</v-list-item-content>
              <v-list-item-content class="align-end">{{ res.resLimit }}</v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>携带方式：</v-list-item-content>
              <v-list-item-content class="align-end">{{ res.resCarryMethod }}</v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>物品所属分类：</v-list-item-content>
              <v-list-item-content class="align-end">{{ res.resClass }}</v-list-item-content>
            </v-list-item>
          </v-list>
        </v-col>
      </v-row>
    </v-card>
  </div>
</template>

<script>
import { server } from "@/common/const.js";

export default {
  props: {
    loading: {
      type: Boolean,
      default: false
    },
    res: Object
  },
  data() {
    return {
      server
    };
  }
};
</script>
