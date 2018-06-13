<template>
  <div id="app">
    <ul>
      <li >{{clients.name}} </li>
    </ul>
  </div>

</template>

<script>

export default {
  data: function () {
    return {
      message: "Hello Vue! obi",
      clients: {
                name: "Austine",
                phone: "08091333369",
                lead_location: "Instagram",
                status: true

      }
    }
  }
}
</script>

<style scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
