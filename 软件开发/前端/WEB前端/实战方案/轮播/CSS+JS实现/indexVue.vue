<template>
  <div class="carousel-container" :style="{ overflow: 'hidden', height: `${itemHeight}px` }">
    <div class="carousel-items" ref="carousel">
      <div
        v-for="(item, idx) in items"
        :key="idx"
        :style="{ height: `${itemHeight}px`, lineHeight: `${itemHeight}px` }"
      >
        {{ item }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    items: {
      type: Array,
      required: true,
    },
    itemHeight: {
      type: Number,
      default: 50,
    },
    delay: {
      type: Number,
      default: 3000,
    },
  },
  data() {
    return {
      index: 0,
    };
  },
  mounted() {
    this.startScrolling();
  },
  beforeDestroy() {
    clearInterval(this.intervalId);
  },
  methods: {
    startScrolling() {
      this.intervalId = setInterval(() => {
        this.index++;
        if (this.index === this.items.length) {
          setTimeout(() => {
            this.$refs.carousel.style.transition = 'none';
            this.$refs.carousel.style.transform = 'translateY(0)';
            this.index = 1;
          }, 500); // 等待过渡结束后瞬间跳回第一条
        } else {
          this.$refs.carousel.style.transition = 'transform 0.5s ease';
          this.$refs.carousel.style.transform = `translateY(-${this.index * this.itemHeight}px)`;
        }
      }, this.delay);
    },
  },
};
</script>

<style scoped>
.carousel-container {
  overflow: hidden;
}
.carousel-items {
  display: flex;
  flex-direction: column;
}
</style>
