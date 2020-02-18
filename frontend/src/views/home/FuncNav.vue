<template>
  <div id="func-nav">
    <v-container class="inner">
      <h1>功能导航</h1>
      <hr />
      <v-row>
        <v-col cols="6" sm="4" v-for="page in pages">
          <div class="func-icon" @click="$router.push(page.route)">
            <i :class="['mdi', page.icon]"></i>
          </div>
          <div class="func-title">{{ page.title }}</div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pages: [
        {
          title: "机场信息",
          route: "/airport_info",
          icon: "mdi-airport"
        },
        {
          title: "航班查询",
          route: "/flight_info",
          icon: "mdi-airplane"
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
          route: "/login",
          icon: "mdi-comment-question-outline"
        }
      ]
    };
  }
};
</script>

<style scoped>
#func-nav {
  width: 100%;
}

.inner {
  width: 80%;
  text-align: center;
}

hr {
  margin: 0 auto 40px auto;
  border: 0;
  color: #237bba;
  background-color: #237bba;
  height: 4px;
  width: 60px;
}

.func-icon {
  border: 1px solid #bebebe;
  border-radius: 50%;
  width: 100px;
  height: 100px;
  margin: auto;
  transition: all 0.5s;
  cursor: pointer;
}

.func-icon:hover {
  border-color: #237bba;
  background-color: #237bba;
}

.func-icon i {
  color: #bebebe;
  font-size: 36px;
  line-height: 95px;
}

.func-icon:hover i {
  color: white;
}

.func-title {
  font-size: 1.2em;
  margin-top: 20px;
}
</style>
