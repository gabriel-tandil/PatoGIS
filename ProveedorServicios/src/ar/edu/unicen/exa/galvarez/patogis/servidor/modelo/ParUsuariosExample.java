package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.util.ArrayList;
import java.util.List;

public class ParUsuariosExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public ParUsuariosExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value,
				String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1,
				Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<Integer> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<Integer> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioIsNull() {
			addCriterion("id_usuario is null");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioIsNotNull() {
			addCriterion("id_usuario is not null");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioEqualTo(Integer value) {
			addCriterion("id_usuario =", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioNotEqualTo(Integer value) {
			addCriterion("id_usuario <>", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioGreaterThan(Integer value) {
			addCriterion("id_usuario >", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_usuario >=", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioLessThan(Integer value) {
			addCriterion("id_usuario <", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioLessThanOrEqualTo(Integer value) {
			addCriterion("id_usuario <=", value, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioIn(List<Integer> values) {
			addCriterion("id_usuario in", values, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioNotIn(List<Integer> values) {
			addCriterion("id_usuario not in", values, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioBetween(Integer value1, Integer value2) {
			addCriterion("id_usuario between", value1, value2, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioNotBetween(Integer value1, Integer value2) {
			addCriterion("id_usuario not between", value1, value2, "idUsuario");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoIsNull() {
			addCriterion("id_usuario_apoyo is null");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoIsNotNull() {
			addCriterion("id_usuario_apoyo is not null");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoEqualTo(Integer value) {
			addCriterion("id_usuario_apoyo =", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoNotEqualTo(Integer value) {
			addCriterion("id_usuario_apoyo <>", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoGreaterThan(Integer value) {
			addCriterion("id_usuario_apoyo >", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_usuario_apoyo >=", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoLessThan(Integer value) {
			addCriterion("id_usuario_apoyo <", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoLessThanOrEqualTo(Integer value) {
			addCriterion("id_usuario_apoyo <=", value, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoIn(List<Integer> values) {
			addCriterion("id_usuario_apoyo in", values, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoNotIn(List<Integer> values) {
			addCriterion("id_usuario_apoyo not in", values, "idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoBetween(Integer value1, Integer value2) {
			addCriterion("id_usuario_apoyo between", value1, value2,
					"idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andIdUsuarioApoyoNotBetween(Integer value1,
				Integer value2) {
			addCriterion("id_usuario_apoyo not between", value1, value2,
					"idUsuarioApoyo");
			return (Criteria) this;
		}

		public Criteria andTipoIsNull() {
			addCriterion("tipo is null");
			return (Criteria) this;
		}

		public Criteria andTipoIsNotNull() {
			addCriterion("tipo is not null");
			return (Criteria) this;
		}

		public Criteria andTipoEqualTo(String value) {
			addCriterion("tipo =", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoNotEqualTo(String value) {
			addCriterion("tipo <>", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoGreaterThan(String value) {
			addCriterion("tipo >", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoGreaterThanOrEqualTo(String value) {
			addCriterion("tipo >=", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoLessThan(String value) {
			addCriterion("tipo <", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoLessThanOrEqualTo(String value) {
			addCriterion("tipo <=", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoLike(String value) {
			addCriterion("tipo like", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoNotLike(String value) {
			addCriterion("tipo not like", value, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoIn(List<String> values) {
			addCriterion("tipo in", values, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoNotIn(List<String> values) {
			addCriterion("tipo not in", values, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoBetween(String value1, String value2) {
			addCriterion("tipo between", value1, value2, "tipo");
			return (Criteria) this;
		}

		public Criteria andTipoNotBetween(String value1, String value2) {
			addCriterion("tipo not between", value1, value2, "tipo");
			return (Criteria) this;
		}

		public Criteria andIdCampanaIsNull() {
			addCriterion("id_campana is null");
			return (Criteria) this;
		}

		public Criteria andIdCampanaIsNotNull() {
			addCriterion("id_campana is not null");
			return (Criteria) this;
		}

		public Criteria andIdCampanaEqualTo(Integer value) {
			addCriterion("id_campana =", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaNotEqualTo(Integer value) {
			addCriterion("id_campana <>", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaGreaterThan(Integer value) {
			addCriterion("id_campana >", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_campana >=", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaLessThan(Integer value) {
			addCriterion("id_campana <", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaLessThanOrEqualTo(Integer value) {
			addCriterion("id_campana <=", value, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaIn(List<Integer> values) {
			addCriterion("id_campana in", values, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaNotIn(List<Integer> values) {
			addCriterion("id_campana not in", values, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaBetween(Integer value1, Integer value2) {
			addCriterion("id_campana between", value1, value2, "idCampana");
			return (Criteria) this;
		}

		public Criteria andIdCampanaNotBetween(Integer value1, Integer value2) {
			addCriterion("id_campana not between", value1, value2, "idCampana");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table public.par_usuarios
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue,
				String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table par_usuarios
     *
     * @mbggenerated do_not_delete_during_merge Sat Jun 04 08:05:19 ART 2011
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}