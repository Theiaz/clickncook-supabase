<template>
  <article class="h-full border-transparent rounded-2xl shadow-md shadow-primary/30">
    <header>
      <slot name="header"></slot>
    </header>
    <section class="p-4">
      <slot name="content"></slot>
    </section>
  </article>
</template>
