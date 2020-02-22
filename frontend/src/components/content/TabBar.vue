<template>
  <div>
    <v-app-bar
      id="tab-bar"
      fixed
      dark
      color="blue darken-3"
      elevate-on-scroll
      :height="tabBarHeight + 'px'"
      style="z-index: 10;"
    >
      <v-app-bar-nav-icon v-if="$vuetify.breakpoint.smAndDown" @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title class="headline ml-0 ml-md-12 font-weight-bold">
        <span @click="$router.push('/')" style="cursor: pointer;">机场安检助手</span>
      </v-toolbar-title>
      <v-tabs v-if="$vuetify.breakpoint.mdAndUp" right class="mr-6" style="width:auto;">
        <v-tab v-for="page in pages" :to="page.route">{{ page.title }}</v-tab>
      </v-tabs>
      <!-- <v-btn
        v-if="$vuetify.breakpoint.mdAndUp"
        tile
        text
        class="subtitle-1"
        @click="$emit('showLoginDialog');"
      >登录/注册</v-btn>-->
    </v-app-bar>

    <!-- 手机端显示侧边导航栏 -->
    <v-navigation-drawer
      id="nav-drawer"
      v-if="$vuetify.breakpoint.smAndDown"
      v-model="drawer"
      fixed
      temporary
      :style="{'padding-top': tabBarHeight - 8 + 'px'}"
    >
      <!-- <v-list-item>
        <v-list-item-avatar>
          <v-img src="https://randomuser.me/api/portraits/men/78.jpg"></v-img>
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title>John Leider</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>-->

      <v-list>
        <v-list-item v-for="page in pages" :to="page.route">
          <v-list-item-icon>
            <v-icon>{{ page.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ page.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <v-divider v-if="$route.path === '/regulations'"></v-divider>

      <v-list v-if="$route.path === '/regulations'">
        <v-subheader>民用航空安全检查规则</v-subheader>
        <v-list-item v-for="(item, i) in $store.state.CARegulations" :key="i" @click="switchCAR(i)">
          <v-list-item-icon>
            <v-icon>mdi-file-document-edit-outline</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <v-divider v-if="$route.path === '/security_check'"></v-divider>

      <v-list v-if="$route.path === '/security_check'">
        <v-subheader>安检须知</v-subheader>
        <v-list-item
          v-for="(item, i) in $store.state.securityCheckTips"
          :key="i"
          @click="switchTips(i)"
        >
          <v-list-item-icon>
            <v-icon>mdi-file-document-edit-outline</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <v-divider v-if="$route.path === '/airport_info'"></v-divider>

      <v-list v-if="$route.path === '/airport_info'">
        <v-subheader>机场信息</v-subheader>
        <v-list-item v-for="(item, i) in airportInfoNav" :key="i" @click="switchInfo(i)">
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
import { tabBarHeight } from "@/common/const.js";

export default {
  data() {
    return {
      tabBarHeight
    };
  },
  methods: {
    switchCAR(index) {
      this.$store.commit("setCurrentShowedCAR", index);
      this.$vuetify.goTo(0, { duration: 0 });
      this.drawer = false;
    },
    switchTips(index) {
      this.$store.commit("setCurrentShowedTips", index);
      this.$vuetify.goTo(0, { duration: 0 });
      this.drawer = false;
    },
    switchInfo(index) {
      this.$store.commit("setCurrentShowedInfo", index);
      this.drawer = false;
    }
  },
  data() {
    return {
      tabBarHeight,
      drawer: false,
      pages: [
        {
          title: "首页",
          route: "/",
          icon: "mdi-home"
        },
        {
          title: "航班查询",
          route: "/flight_info",
          icon: "mdi-airplane"
        },
        {
          title: "机场信息",
          route: "/airport_info",
          icon: "mdi-airport"
        },
        {
          title: "安检须知",
          route: "/security_check",
          icon: "mdi-bag-checked"
        },
        {
          title: "危险物品",
          route: "/danger",
          icon: "mdi-alert-outline"
        },
        {
          title: "民航法规",
          route: "/regulations",
          icon: "mdi-file-document-edit-outline"
        },
        {
          title: "满意度调查",
          route: "/satisfaction",
          icon: "mdi-comment-question-outline"
        }
      ],

      airportInfoNav: [
        {
          title: "室内地图",
          icon: "mdi-map-marker"
        },
        {
          title: "天气情况",
          icon: "mdi-weather-cloudy"
        },
        {
          title: "安检口排队情况",
          icon: "mdi-account-group"
        }
      ]
    };
  }
};
</script>
