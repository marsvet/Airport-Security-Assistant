<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="flightInfos"
      disable-pagination
      disable-sort
      disable-filtering
      fixed-header
      hide-default-footer
      :loading="loading"
      no-data-text="无数据"
      :height="tableHeight"
    ></v-data-table>
  </div>
</template>

<script>
export default {
  props: {
    flightInfos: {
      type: Array,
      default: []
    },
    loading: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      headers: [
        {
          text: "航班号",
          align: "center",
          value: "flightNo"
        },
        {
          text: "航空公司",
          align: "center",
          value: "airlineCompany"
        },
        {
          text: "计划起飞时间",
          align: "center",
          value: "tkTime"
        },
        {
          text: "计划到达时间",
          align: "center",
          value: "arTime"
        },
        {
          text: "出发地",
          align: "center",
          value: "leavePlace"
        },
        {
          text: "目的地",
          align: "center",
          value: "arrivePlace"
        },
        {
          text: "航班状态",
          align: "center",
          value: "status"
        }
      ]
    };
  },
  computed: {
    tableHeight() {
      if (this.$vuetify.breakpoint.smAndDown) return undefined;
      else return "300";
    }
  }
};
</script>
